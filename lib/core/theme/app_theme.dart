import 'package:flutter/material.dart';

import 'tokens.dart';

/// Creates the [ThemeData] for the Kotoka app using Material 3
/// and KColors / KTypography tokens exclusively — no hardcoded values.
/// Light mode only for beta.
class AppTheme {
  AppTheme._();

  static ThemeData get light => _build();
  static ThemeData lightTheme() => _build();

  static ThemeData _build() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: _lightColorScheme,
      fontFamily: 'IBMPlexSans',

      scaffoldBackgroundColor: KColors.pageBg,

      appBarTheme: const AppBarTheme(
        backgroundColor: KColors.surfacePrimary,
        foregroundColor: KColors.textPrimary,
        elevation: KElevation.elevation0,
        scrolledUnderElevation: KElevation.elevation1,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: KColors.textPrimary,
        ),
      ),

      textTheme: _buildTextTheme(),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: KColors.interactivePrimary,
          foregroundColor: KColors.textInverse,
          disabledBackgroundColor: KColors.neutral300,
          disabledForegroundColor: KColors.textDisabled,
          elevation: KElevation.elevation1,
          padding: const EdgeInsets.symmetric(
            horizontal: KSpacing.sp24,
            vertical: KSpacing.sp12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: KRadius.md,
          ),
          textStyle: const TextStyle(
            fontFamily: 'IBMPlexSans',
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
          minimumSize: const Size(64, 48),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: KColors.interactivePrimary,
          side: const BorderSide(color: KColors.brand500, width: 1.5),
          padding: const EdgeInsets.symmetric(
            horizontal: KSpacing.sp24,
            vertical: KSpacing.sp12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: KRadius.md,
          ),
          textStyle: const TextStyle(
            fontFamily: 'IBMPlexSans',
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
          minimumSize: const Size(64, 48),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: KColors.interactivePrimary,
          padding: const EdgeInsets.symmetric(
            horizontal: KSpacing.sp16,
            vertical: KSpacing.sp8,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: KRadius.md,
          ),
          textStyle: const TextStyle(
            fontFamily: 'IBMPlexSans',
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
          minimumSize: const Size(48, 40),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: KColors.neutral50,
        contentPadding: EdgeInsets.symmetric(
          horizontal: KSpacing.sp16,
          vertical: KSpacing.sp12,
        ),
        border: OutlineInputBorder(
          borderRadius: KRadius.md,
          borderSide: BorderSide(color: KColors.borderDefault),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: KRadius.md,
          borderSide: BorderSide(color: KColors.borderDefault),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: KRadius.md,
          borderSide: BorderSide(color: KColors.borderBrand, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: KRadius.md,
          borderSide: BorderSide(color: KColors.error500),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: KRadius.md,
          borderSide: BorderSide(color: KColors.error500, width: 2.0),
        ),
        hintStyle: TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 15.0,
          color: KColors.textDisabled,
        ),
        labelStyle: TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 15.0,
          color: KColors.textSecondary,
        ),
        errorStyle: TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 12.0,
          color: KColors.error500,
        ),
      ),

      cardTheme: CardThemeData(
        color: KColors.surfacePrimary,
        elevation: KElevation.elevation1,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: KRadius.md,
          side: BorderSide(
            color: KColors.brand400.withValues(alpha: 0.20),
            width: 1.0,
          ),
        ),
      ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: KColors.surfacePrimary,
        selectedItemColor: KColors.brand600,
        unselectedItemColor: KColors.neutral500,
        elevation: KElevation.elevation2,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 11.0,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 11.0,
          fontWeight: FontWeight.w400,
        ),
      ),

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: KColors.surfacePrimary,
        indicatorColor: KColors.brand100,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: KColors.brand500, size: 24);
          }
          return const IconThemeData(color: KColors.neutral500, size: 24);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(
              fontFamily: 'IBMPlexSans',
              fontSize: 11.0,
              fontWeight: FontWeight.w600,
              color: KColors.brand500,
            );
          }
          return const TextStyle(
            fontFamily: 'IBMPlexSans',
            fontSize: 11.0,
            fontWeight: FontWeight.w400,
            color: KColors.neutral500,
          );
        }),
        elevation: KElevation.elevation2,
        height: 64.0,
      ),

      chipTheme: ChipThemeData(
        backgroundColor: KColors.neutral100,
        selectedColor: KColors.brand100,
        disabledColor: KColors.neutral200,
        labelStyle: TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 13.0,
          fontWeight: FontWeight.w500,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: KSpacing.sp12,
          vertical: KSpacing.sp4,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: KRadius.full,
        ),
        side: BorderSide.none,
      ),

      dividerTheme: const DividerThemeData(
        color: KColors.borderDefault,
        thickness: 1.0,
        space: 1.0,
      ),

      iconTheme: const IconThemeData(
        color: KColors.textPrimary,
        size: 24.0,
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: KColors.neutral900,
        contentTextStyle: const TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 14.0,
          color: KColors.textInverse,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: KRadius.md),
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: KColors.surfacePrimary,
        elevation: KElevation.elevation4,
        shape: RoundedRectangleBorder(borderRadius: KRadius.xl),
        titleTextStyle: TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          color: KColors.textPrimary,
        ),
        contentTextStyle: TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 15.0,
          color: KColors.textSecondary,
        ),
      ),
    );
  }

  static const ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: KColors.brand500,
    onPrimary: KColors.neutral0,
    primaryContainer: KColors.brand100,
    onPrimaryContainer: KColors.neutral900,
    secondary: KColors.brand400,
    onSecondary: KColors.neutral900,
    secondaryContainer: KColors.brand50,
    onSecondaryContainer: KColors.neutral900,
    tertiary: KColors.info500,
    onTertiary: KColors.neutral0,
    tertiaryContainer: KColors.info100,
    onTertiaryContainer: KColors.info700,
    error: KColors.error500,
    onError: KColors.neutral0,
    errorContainer: KColors.error100,
    onErrorContainer: KColors.error700,
    surface: KColors.surfacePrimary,
    onSurface: KColors.textPrimary,
    surfaceContainerHighest: KColors.neutral100,
    onSurfaceVariant: KColors.textSecondary,
    outline: KColors.borderDefault,
    outlineVariant: KColors.neutral200,
    shadow: KColors.neutral900,
    scrim: KColors.neutral900,
    inverseSurface: KColors.neutral900,
    onInverseSurface: KColors.neutral0,
    inversePrimary: KColors.brand200,
  );

  static TextTheme _buildTextTheme() {
    const base = KColors.textPrimary;
    const subtle = KColors.textSecondary;

    return const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'IBMPlexSans',
        fontSize: 57.0,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.25,
        color: base,
      ),
      displayMedium: TextStyle(
        fontFamily: 'IBMPlexSans',
        fontSize: 45.0,
        fontWeight: FontWeight.w400,
        color: base,
      ),
      displaySmall: TextStyle(
        fontFamily: 'IBMPlexSans',
        fontSize: 36.0,
        fontWeight: FontWeight.w400,
        color: base,
      ),
      headlineLarge: TextStyle(
        fontFamily: 'IBMPlexSans',
        fontSize: 32.0,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
        color: base,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'IBMPlexSans',
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.25,
        color: base,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'IBMPlexSans',
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: base,
      ),
      titleLarge: TextStyle(
        fontFamily: 'IBMPlexSans',
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
        color: base,
      ),
      titleMedium: TextStyle(
        fontFamily: 'IBMPlexSans',
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        color: base,
      ),
      titleSmall: TextStyle(
        fontFamily: 'IBMPlexSans',
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        color: base,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'IBMPlexSans',
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: base,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'IBMPlexSans',
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: base,
      ),
      bodySmall: TextStyle(
        fontFamily: 'IBMPlexSans',
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: subtle,
      ),
      labelLarge: TextStyle(
        fontFamily: 'IBMPlexSans',
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        color: base,
      ),
      labelMedium: TextStyle(
        fontFamily: 'IBMPlexSans',
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: subtle,
      ),
      labelSmall: TextStyle(
        fontFamily: 'IBMPlexSans',
        fontSize: 11.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: subtle,
      ),
    );
  }
}
