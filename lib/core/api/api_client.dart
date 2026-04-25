/// Dio-based API client with:
///   - Firebase ID token Bearer interceptor
///   - Rate limiter interceptor
///   - 401 → token refresh
///   - 429 → RateLimitException
library;

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'rate_limiter.dart';

// ---------------------------------------------------------------------------
// Environment helper — base URL injected at build time via --dart-define
// ---------------------------------------------------------------------------
class _Env {
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://api.kotoka.app/v1',
  );
}

// ---------------------------------------------------------------------------
// Custom exceptions
// ---------------------------------------------------------------------------
class ApiException implements Exception {
  const ApiException({
    required this.statusCode,
    required this.message,
    this.data,
  });

  final int statusCode;
  final String message;
  final dynamic data;

  @override
  String toString() => 'ApiException($statusCode): $message';
}

class UnauthorizedException extends ApiException {
  const UnauthorizedException({super.data})
      : super(statusCode: 401, message: 'Unauthorized');
}

// ---------------------------------------------------------------------------
// Firebase token interceptor
// ---------------------------------------------------------------------------
class _FirebaseTokenInterceptor extends Interceptor {
  _FirebaseTokenInterceptor(this._auth);

  final FirebaseAuth _auth;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        // forceRefresh=false — uses cached token if still valid
        final token = await user.getIdToken(false);
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
      }
    } catch (_) {
      // If token fetch fails, let the request proceed — the server will 401
    }
    handler.next(options);
  }
}

// ---------------------------------------------------------------------------
// Rate limiter interceptor
// ---------------------------------------------------------------------------
class _RateLimiterInterceptor extends Interceptor {
  _RateLimiterInterceptor(this._limiter);

  final RateLimiter _limiter;

  /// Maps a request path prefix to an endpoint key.
  String _endpointKey(String path) {
    if (path.contains('/gemini') || path.contains('/generate')) {
      return RateLimiterEndpoint.gemini;
    }
    if (path.contains('/tts') || path.contains('/speech')) {
      return RateLimiterEndpoint.tts;
    }
    return RateLimiterEndpoint.defaultEndpoint;
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final key = _endpointKey(options.path);
    try {
      await _limiter.acquire(key);
      handler.next(options);
    } on RateLimitException catch (e) {
      handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.cancel,
          error: e,
          message: 'Rate limit exceeded for $key. '
              'Retry after ${e.retryAfterMs}ms.',
        ),
        true,
      );
    }
  }
}

// ---------------------------------------------------------------------------
// Error interceptor
// ---------------------------------------------------------------------------
class _ErrorInterceptor extends Interceptor {
  _ErrorInterceptor(this._auth, this._dio);

  final FirebaseAuth _auth;
  final Dio _dio;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Propagate rate limit errors as-is
    if (err.error is RateLimitException) {
      return handler.next(err);
    }

    final statusCode = err.response?.statusCode;

    if (statusCode == 401) {
      // Attempt token refresh then retry once
      try {
        final user = _auth.currentUser;
        if (user != null) {
          final freshToken = await user.getIdToken(true); // forceRefresh
          if (freshToken != null) {
            final opts = err.requestOptions;
            opts.headers['Authorization'] = 'Bearer $freshToken';
            final response = await _dio.fetch(opts);
            return handler.resolve(response);
          }
        }
      } catch (_) {
        // Fall through to reject
      }
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: const UnauthorizedException(),
          type: DioExceptionType.badResponse,
          response: err.response,
        ),
      );
    }

    if (statusCode == 429) {
      final retryAfter =
          int.tryParse(err.response?.headers.value('retry-after') ?? '') ??
              60000;
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: RateLimitException(
            endpoint: err.requestOptions.path,
            retryAfterMs: retryAfter * 1000,
          ),
          type: DioExceptionType.badResponse,
          response: err.response,
        ),
      );
    }

    handler.next(err);
  }
}

// ---------------------------------------------------------------------------
// ApiClient
// ---------------------------------------------------------------------------
class ApiClient {
  ApiClient._({
    required FirebaseAuth auth,
    RateLimiter? rateLimiter,
    String? baseUrl,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? _Env.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'X-App-Version': '1.0.0',
        },
      ),
    );

    final limiter = rateLimiter ?? RateLimiter.instance;

    _dio.interceptors.addAll([
      _FirebaseTokenInterceptor(auth),
      _RateLimiterInterceptor(limiter),
      _ErrorInterceptor(auth, _dio),
      LogInterceptor(
        requestBody: false,
        responseBody: false,
        logPrint: (obj) {
          assert(() {
            // ignore: avoid_print
            print('[ApiClient] $obj');
            return true;
          }());
        },
      ),
    ]);
  }

  late final Dio _dio;

  // ------------------------------------------------------------------
  // Singleton factory
  // ------------------------------------------------------------------
  static ApiClient? _instance;

  static ApiClient get instance {
    assert(
      _instance != null,
      'ApiClient must be initialised with ApiClient.init() before use.',
    );
    return _instance!;
  }

  /// Call once in main() after Firebase is initialised.
  static void init({
    FirebaseAuth? auth,
    RateLimiter? rateLimiter,
    String? baseUrl,
  }) {
    _instance = ApiClient._(
      auth: auth ?? FirebaseAuth.instance,
      rateLimiter: rateLimiter,
      baseUrl: baseUrl,
    );
  }

  // ------------------------------------------------------------------
  // HTTP helpers
  // ------------------------------------------------------------------

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) =>
      _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
      );

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) =>
      _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) =>
      _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) =>
      _dio.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) =>
      _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

  /// Raw Dio instance for advanced usage (multipart, etc.)
  Dio get raw => _dio;
}
