import 'package:flutter/material.dart';

import 'tokens.dart';

/// Creates the [ThemeData] for the Kotoka app using Material 3
/// and KColors / KTypography tokens exclusively — no hardcoded values.
class AppTheme {
  AppTheme._();

  // ------------------------------------------------------------------
  // Light theme
  // ------------------------------------------------------------------
  static ThemeData get light => _build(brightness: Brightness.light);
  static ThemeData lightTheme() => _build(brightness: Brightness.light);

  // ------------------------------------------------------------------
  // Dark theme
  // ------------------------------------------------------------------
  static ThemeData get dark => _build(brightness: Brightness.dark);
  static ThemeData darkTheme() => _build(brightness: Brightness.dark);

  // ------------------------------------------------------------------
  // Internal builder
  // ------------------------------------------------------------------
  static ThemeData _build({required Brightness brightness}) {
    final isDark = brightness == Brightness.dark;

    final colorScheme = isDark ? _darkColorScheme : _lightColorScheme;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      fontFamily: 'IBMPlexSans',

      // ----------------------------------------------------------------
      // Scaffold / background
      // ----------------------------------------------------------------
      scaffoldBackgroundColor: isDark ? KColorsDark.bgPage : KColors.surfacePrimary,

      // ----------------------------------------------------------------
      // AppBar
      // ----------------------------------------------------------------
      appBarTheme: AppBarTheme(
        backgroundColor: isDark ? KColorsDark.bgAppBar : KColors.surfacePrimary,
        foregroundColor: isDark ? KColors.textInverse : KColors.textPrimary,
        elevation: KElevation.elevation0,
        scrolledUnderElevation: KElevation.elevation1,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: isDark ? KColors.textInverse : KColors.textPrimary,
        ),
      ),

      // ----------------------------------------------------------------
      // Text theme — all styles use IBMPlexSans tokens
      // ----------------------------------------------------------------
      textTheme: _buildTextTheme(isDark: isDark),

      // ----------------------------------------------------------------
      // Elevated button
      // ----------------------------------------------------------------
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

      // ----------------------------------------------------------------
      // Outlined button
      // ----------------------------------------------------------------
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: KColors.interactivePrimary,
          side: const BorderSide(color: KColors.borderBrand, width: 1.5),
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

      // ----------------------------------------------------------------
      // Text button
      // ----------------------------------------------------------------
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

      // ----------------------------------------------------------------
      // Input decoration
      // ----------------------------------------------------------------
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark ? KColorsDark.inputBg : KColors.neutral50,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: KSpacing.sp16,
          vertical: KSpacing.sp12,
        ),
        border: OutlineInputBorder(
          borderRadius: KRadius.md,
          borderSide: const BorderSide(color: KColors.borderDefault),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: KRadius.md,
          borderSide: const BorderSide(color: KColors.borderDefault),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: KRadius.md,
          borderSide: const BorderSide(color: KColors.borderBrand, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: KRadius.md,
          borderSide: const BorderSide(color: KColors.error500),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: KRadius.md,
          borderSide: const BorderSide(color: KColors.error500, width: 2.0),
        ),
        hintStyle: TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 15.0,
          color: KColors.textDisabled,
        ),
        labelStyle: const TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 15.0,
          color: KColors.textSecondary,
        ),
        errorStyle: const TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 12.0,
          color: KColors.error500,
        ),
      ),

      // ----------------------------------------------------------------
      // Card
      // ----------------------------------------------------------------
      cardTheme: CardThemeData(
        color: isDark ? KColorsDark.bgCard : KColors.surfacePrimary,
        elevation: KElevation.elevation1,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: KRadius.lg,
          side: BorderSide(
            color: isDark ? KColors.neutral700 : KColors.borderDefault,
            width: 1.0,
          ),
        ),
      ),

      // ----------------------------------------------------------------
      // Bottom navigation bar
      // ----------------------------------------------------------------
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: isDark ? KColors.neutral900 : KColors.surfacePrimary,
        selectedItemColor: KColors.brand600,
        unselectedItemColor: KColors.neutral500,
        elevation: KElevation.elevation2,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 11.0,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 11.0,
          fontWeight: FontWeight.w400,
        ),
      ),

      // ----------------------------------------------------------------
      // Navigation bar (Material 3)
      // ----------------------------------------------------------------
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: isDark ? KColorsDark.bgAppBar : KColors.surfacePrimary,
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

      // ----------------------------------------------------------------
      // Chip
      // ----------------------------------------------------------------
      chipTheme: ChipThemeData(
        backgroundColor: isDark ? KColors.neutral800 : KColors.neutral100,
        selectedColor: KColors.brand100,
        disabledColor: KColors.neutral200,
        labelStyle: const TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 13.0,
          fontWeight: FontWeight.w500,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: KSpacing.sp12,
          vertical: KSpacing.sp4,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: KRadius.full,
        ),
        side: BorderSide.none,
      ),

      // ----------------------------------------------------------------
      // Divider
      // ----------------------------------------------------------------
      dividerTheme: const DividerThemeData(
        color: KColors.borderDefault,
        thickness: 1.0,
        space: 1.0,
      ),

      // ----------------------------------------------------------------
      // Icon
      // ----------------------------------------------------------------
      iconTheme: IconThemeData(
        color: isDark ? KColors.textInverse : KColors.textPrimary,
        size: 24.0,
      ),

      // ----------------------------------------------------------------
      // Snack bar
      // ----------------------------------------------------------------
      snackBarTheme: SnackBarThemeData(
        backgroundColor: isDark ? KColors.neutral700 : KColors.neutral900,
        contentTextStyle: const TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 14.0,
          color: KColors.textInverse,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: KRadius.md),
      ),

      // ----------------------------------------------------------------
      // Dialog
      // ----------------------------------------------------------------
      dialogTheme: DialogThemeData(
        backgroundColor: isDark ? KColors.neutral800 : KColors.surfacePrimary,
        elevation: KElevation.elevation4,
        shape: RoundedRectangleBorder(borderRadius: KRadius.xl),
        titleTextStyle: TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          color: isDark ? KColors.textInverse : KColors.textPrimary,
        ),
        contentTextStyle: TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 15.0,
          color: isDark ? KColors.neutral300 : KColors.textSecondary,
        ),
      ),
    );
  }

  // ------------------------------------------------------------------
  // Color schemes
  // ------------------------------------------------------------------
  static const ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: KColors.brand500,       // teal — primary interactive
    onPrimary: KColors.neutral900,   // dark text on teal
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

  static const ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: KColors.brand500,       // teal — same primary as light
    onPrimary: KColors.neutral900,   // dark text on teal
    primaryContainer: KColors.brand600,
    onPrimaryContainer: KColors.neutral0,
    secondary: KColors.brand400,     // bright cyan accent
    onSecondary: KColors.neutral900,
    secondaryContainer: KColors.neutral800,
    onSecondaryContainer: KColors.brand400,
    tertiary: KColors.info300,
    onTertiary: KColors.neutral900,
    tertiaryContainer: KColors.info700,
    onTertiaryContainer: KColors.info100,
    error: KColors.error400,
    onError: KColors.neutral900,
    errorContainer: KColors.error700,
    onErrorContainer: KColors.error100,
    surface: KColors.neutral900,
    onSurface: KColors.neutral50,
    surfaceContainerHighest: KColors.neutral800,
    onSurfaceVariant: KColors.neutral400,
    outline: KColors.neutral700,
    outlineVariant: KColors.neutral800,
    shadow: KColors.neutral1000,
    scrim: KColors.neutral1000,
    inverseSurface: KColors.neutral100,
    onInverseSurface: KColors.neutral900,
    inversePrimary: KColors.brand500,
  );

  // ------------------------------------------------------------------
  // Text theme builder
  // ------------------------------------------------------------------
  static TextTheme _buildTextTheme({required bool isDark}) {
    final base = isDark ? KColorsDark.textPrimary : KColors.textPrimary;
    final subtle = isDark ? KColorsDark.textSecondary : KColors.textSecondary;

    return TextTheme(
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
