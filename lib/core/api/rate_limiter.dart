/// Token-bucket rate limiter with per-endpoint configuration.
///
/// Buckets:
///   - default  : 60 req/min
///   - gemini   : 14 req/min
///   - tts      : 20 req/min
///
/// Each bucket holds [capacity] tokens that refill every 60 seconds.
/// [acquire] consumes one token; if the bucket is empty it throws
/// [RateLimitException].
library;

import 'dart:async';

// ---------------------------------------------------------------------------
// Exception
// ---------------------------------------------------------------------------
class RateLimitException implements Exception {
  const RateLimitException({
    required this.endpoint,
    required this.retryAfterMs,
  });

  final String endpoint;
  final int retryAfterMs;

  @override
  String toString() =>
      'RateLimitException: endpoint=$endpoint, retryAfterMs=$retryAfterMs';
}

// ---------------------------------------------------------------------------
// Bucket configuration
// ---------------------------------------------------------------------------
class _BucketConfig {
  const _BucketConfig({
    required this.capacity,
    this.windowSeconds = 60,
  });

  final int capacity;
  final int windowSeconds;
}

// ---------------------------------------------------------------------------
// Token bucket
// ---------------------------------------------------------------------------
class _TokenBucket {
  _TokenBucket(this._config)
      : _tokens = _config.capacity,
        _lastRefill = DateTime.now();

  final _BucketConfig _config;
  int _tokens;
  DateTime _lastRefill;

  /// Returns true if a token was consumed; throws [RateLimitException] if
  /// the bucket is empty.
  bool tryConsume(String endpointKey) {
    _maybeRefill();
    if (_tokens <= 0) {
      final msUntilRefill = _msUntilNextRefill();
      throw RateLimitException(
        endpoint: endpointKey,
        retryAfterMs: msUntilRefill,
      );
    }
    _tokens--;
    return true;
  }

  void _maybeRefill() {
    final now = DateTime.now();
    final elapsedMs = now.difference(_lastRefill).inMilliseconds;
    if (elapsedMs >= _config.windowSeconds * 1000) {
      _tokens = _config.capacity;
      _lastRefill = now;
    }
  }

  int _msUntilNextRefill() {
    final elapsed = DateTime.now().difference(_lastRefill).inMilliseconds;
    final windowMs = _config.windowSeconds * 1000;
    return (windowMs - elapsed).clamp(0, windowMs);
  }

  /// Remaining tokens in current window (for diagnostics).
  int get remaining {
    _maybeRefill();
    return _tokens;
  }
}

// ---------------------------------------------------------------------------
// RateLimiter
// ---------------------------------------------------------------------------

/// Endpoint identifiers — use these constants when calling [acquire].
class RateLimiterEndpoint {
  RateLimiterEndpoint._();

  static const String defaultEndpoint = 'default';
  static const String gemini = 'gemini';
  static const String tts = 'tts';
}

class RateLimiter {
  RateLimiter._() {
    _initBuckets();
  }

  static final RateLimiter instance = RateLimiter._();

  late final Map<String, _TokenBucket> _buckets;

  static const Map<String, _BucketConfig> _configs = {
    RateLimiterEndpoint.defaultEndpoint: _BucketConfig(capacity: 60),
    RateLimiterEndpoint.gemini: _BucketConfig(capacity: 14),
    RateLimiterEndpoint.tts: _BucketConfig(capacity: 20),
  };

  void _initBuckets() {
    _buckets = {
      for (final entry in _configs.entries)
        entry.key: _TokenBucket(entry.value),
    };
  }

  /// Acquires a token for [endpointKey].
  ///
  /// Returns `true` on success.
  /// Throws [RateLimitException] when the bucket for that endpoint is empty.
  ///
  /// If [endpointKey] is not configured, falls back to
  /// [RateLimiterEndpoint.defaultEndpoint].
  Future<bool> acquire(String endpointKey) async {
    final bucket =
        _buckets[endpointKey] ?? _buckets[RateLimiterEndpoint.defaultEndpoint]!;
    return bucket.tryConsume(endpointKey);
  }

  /// Returns the number of remaining tokens for [endpointKey].
  int remaining(String endpointKey) {
    final bucket =
        _buckets[endpointKey] ?? _buckets[RateLimiterEndpoint.defaultEndpoint]!;
    return bucket.remaining;
  }

  /// Resets all buckets (useful in tests).
  void resetAll() {
    _initBuckets();
  }
}
