import 'dart:math' as math;
import 'package:flutter/material.dart';

// ---------------------------------------------------------------------------
// KColors — brand palette + semantic + mood tints
// ---------------------------------------------------------------------------
class KColors {
  KColors._();

  // Brand teal-purple
  static const Color brand50  = Color(0xFFE8E1F0);  // Very Light Lavender
  static const Color brand100 = Color(0xFFFFE1DF);  // Light Peach
  static const Color brand200 = Color(0xFFFFB6CB);  // Pink
  static const Color brand300 = Color(0xFFFFB6CB);  // Pink
  static const Color brand400 = Color(0xFF0CF6FC);  // Bright Cyan
  static const Color brand500 = Color(0xFF00C8CC);  // Teal/Cyan
  static const Color brand600 = Color(0xFF8C6792);  // Dark Purple
  static const Color brand700 = Color(0xFF682069);  // Deep Purple — primary CTA
  static const Color brand800 = Color(0xFF4A1549);  // Dark purple
  static const Color brand900 = Color(0xFF000000);  // Black

  // Neutral grays
  static const Color neutral0 = Color(0xFFFFFFFF);
  static const Color neutral50 = Color(0xFFF8F9FA);
  static const Color neutral100 = Color(0xFFF1F3F5);
  static const Color neutral200 = Color(0xFFE9ECEF);
  static const Color neutral300 = Color(0xFFDEE2E6);
  static const Color neutral400 = Color(0xFFCED4DA);
  static const Color neutral500 = Color(0xFFADB5BD);
  static const Color neutral600 = Color(0xFF6C757D);
  static const Color neutral700 = Color(0xFF495057);
  static const Color neutral800 = Color(0xFF343A40);
  static const Color neutral900 = Color(0xFF212529);
  static const Color neutral1000 = Color(0xFF000000);

  // Semantic — success
  static const Color success100 = Color(0xFFD3F9D8);
  static const Color success300 = Color(0xFF69DB7C);
  static const Color success500 = Color(0xFF2F9E44);
  static const Color success700 = Color(0xFF1A6B2E);

  // Semantic — warning
  static const Color warning100 = Color(0xFFFFF3BF);
  static const Color warning300 = Color(0xFFFFD43B);
  static const Color warning500 = Color(0xFFFFDFA2);
  static const Color warning700 = Color(0xFFE67700);

  // Semantic — error
  static const Color error100 = Color(0xFFFFE0E4);
  static const Color error300 = Color(0xFFE88090);
  static const Color error400 = Color(0xFFE06070);
  static const Color error500 = Color(0xFFD8566A);
  static const Color error700 = Color(0xFFB03050);

  // Semantic — info
  static const Color info100 = Color(0xFFD0EBFF);
  static const Color info300 = Color(0xFF74C0FC);
  static const Color info500 = Color(0xFF228BE6);
  static const Color info700 = Color(0xFF1864AB);

  // Mood tints (used for sensory anchoring)
  static const Color moodCalm = Color(0xFFE8E1F0);
  static const Color moodEnergy = Color(0xFFFFE1DF);
  static const Color moodFocus = Color(0xFFFFB6CB);
  static const Color moodJoy = Color(0xFFFFDFA2);
  static const Color moodRelax = Color(0xFFF3F0FF);
  static const Color moodCool = Color(0xFFE3FAFC);

  // Surface / background
  static const Color surfacePrimary = neutral0;
  static const Color surfaceSecondary = neutral50;
  static const Color surfaceTertiary = neutral100;
  static const Color surfaceInverse = neutral900;

  // Text
  static const Color textPrimary = neutral900;
  static const Color textSecondary = neutral600;
  static const Color textDisabled = neutral400;
  static const Color textInverse = neutral0;
  static const Color textBrand = brand600;

  // Border
  static const Color borderDefault = neutral200;
  static const Color borderStrong = neutral400;
  static const Color borderBrand = brand400;

  // Interactive states — teal/cyan is the primary action colour
  static const Color interactivePrimary = brand500;
  static const Color interactivePrimaryHover = brand400;
  static const Color interactivePrimaryPressed = brand600;
  static const Color interactiveSecondary = neutral100;
  static const Color interactiveSecondaryHover = neutral200;
  static const Color interactiveDestructive = error500;
}

// ---------------------------------------------------------------------------
// KColorsDark — dark mode semantic color tokens
// ---------------------------------------------------------------------------
class KColorsDark {
  KColorsDark._();

  static const Color bgPage = Color(0xFF444444);
  static const Color bgCard = Color(0xFF525252);
  static const Color bgSurface = Color(0xFF3A3A3A);
  static const Color bgAppBar = Color(0xFF3C3C3C);
  static const Color textPrimary = Color(0xFFF9FAFB);
  static const Color textSecondary = Color(0xFFD1D5DB);
  static const Color textCaption = Color(0xFF9CA3AF);
  static const Color border = Color(0xFF374151);
  static const Color tagBg = Color(0xFF1E3A5F);
  static const Color tagText = Color(0xFF93C5FD);
  static const Color inputBg = Color(0xFF1F2937);
  static const Color divider = Color(0xFF374151);
  // Brand colors stay same
  static const Color brand700 = KColors.brand700;
  static const Color brand500 = KColors.brand500;
}

// ---------------------------------------------------------------------------
// KSpacing — spacing scale
// ---------------------------------------------------------------------------
class KSpacing {
  KSpacing._();

  static const double sp2 = 2.0;
  static const double sp4 = 4.0;
  static const double sp8 = 8.0;
  static const double sp12 = 12.0;
  static const double sp16 = 16.0;
  static const double sp20 = 20.0;
  static const double sp24 = 24.0;
  static const double sp32 = 32.0;
  static const double sp40 = 40.0;
  static const double sp48 = 48.0;
  static const double sp64 = 64.0;
  static const double sp80 = 80.0;
  static const double sp96 = 96.0;
}

// ---------------------------------------------------------------------------
// KRadius — border-radius tokens
// ---------------------------------------------------------------------------
class KRadius {
  KRadius._();

  static const double radiusXs = 4.0;
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 24.0;
  static const double radiusFull = 999.0;

  static BorderRadius get sm => BorderRadius.circular(radiusSm);
  static BorderRadius get md => BorderRadius.circular(radiusMd);
  static BorderRadius get lg => BorderRadius.circular(radiusLg);
  static BorderRadius get xl => BorderRadius.circular(radiusXl);
  static BorderRadius get full => BorderRadius.circular(radiusFull);
}

// ---------------------------------------------------------------------------
// KElevation — shadow elevation tokens
// ---------------------------------------------------------------------------
class KElevation {
  KElevation._();

  static const double elevation0 = 0.0;
  static const double elevation1 = 1.0;
  static const double elevation2 = 3.0;
  static const double elevation3 = 6.0;
  static const double elevation4 = 12.0;
  static const double elevation5 = 24.0;

  static const List<BoxShadow> shadow1 = [
    BoxShadow(
      color: Color(0x0A000000),
      blurRadius: 4,
      offset: Offset(0, 1),
    ),
  ];

  static const List<BoxShadow> shadow2 = [
    BoxShadow(
      color: Color(0x14000000),
      blurRadius: 8,
      offset: Offset(0, 2),
    ),
  ];
}

// ---------------------------------------------------------------------------
// KMotion — duration tokens
// ---------------------------------------------------------------------------
class KMotion {
  KMotion._();

  static const Duration instant = Duration(milliseconds: 100);
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration verySlow = Duration(milliseconds: 800);

  // Curves
  static const Curve defaultCurve = Curves.easeInOut;
  static const Curve enterCurve = Curves.easeOut;
  static const Curve exitCurve = Curves.easeIn;
  static const Curve bounceCurve = Curves.elasticOut;
  static const Curve sharpCurve = Curves.easeInOutCubic;
}

// ---------------------------------------------------------------------------
// KTextStyle enum — all named text styles
// ---------------------------------------------------------------------------
enum KTextStyle {
  h1,
  h2,
  h3,
  h4,
  body,
  bodySmall,
  caption,
  label,
  button,
  targetWord,
  romanization,
}

// ---------------------------------------------------------------------------
// KTypography — locale-aware text styles
// ---------------------------------------------------------------------------
class KTypography {
  KTypography._();

  /// Locales that use Sarabun font
  static const Set<String> _sarabunLocales = {'th', 'lo'};

  /// Returns the appropriate font family for the given locale.
  static String fontFamilyForLocale(Locale locale) {
    if (_sarabunLocales.contains(locale.languageCode)) {
      return 'Sarabun';
    }
    return 'IBMPlexSans';
  }

  /// Returns the minimum font size for Thai/Lao locales.
  static double _minThaiSize(double size, Locale locale) =>
      (locale.languageCode == 'th' || locale.languageCode == 'lo')
          ? math.max(size, 15.0)
          : size;

  /// Returns a [TextStyle] for the given [KTextStyle] and [Locale].
  static TextStyle getStyle(KTextStyle style, Locale locale) {
    final family = fontFamilyForLocale(locale);

    switch (style) {
      case KTextStyle.h1:
        return TextStyle(
          fontFamily: family,
          fontSize: 32.0,
          fontWeight: FontWeight.w700,
          height: 1.25,
          letterSpacing: -0.5,
          color: KColors.textPrimary,
        );
      case KTextStyle.h2:
        return TextStyle(
          fontFamily: family,
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          height: 1.3,
          letterSpacing: -0.25,
          color: KColors.textPrimary,
        );
      case KTextStyle.h3:
        return TextStyle(
          fontFamily: family,
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
          height: 1.35,
          letterSpacing: 0.0,
          color: KColors.textPrimary,
        );
      case KTextStyle.h4:
        return TextStyle(
          fontFamily: family,
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
          height: 1.4,
          letterSpacing: 0.0,
          color: KColors.textPrimary,
        );
      case KTextStyle.body:
        return TextStyle(
          fontFamily: family,
          fontSize: _minThaiSize(15.0, locale),
          fontWeight: FontWeight.w400,
          height: 1.5,
          letterSpacing: 0.1,
          color: KColors.textPrimary,
        );
      case KTextStyle.bodySmall:
        return TextStyle(
          fontFamily: family,
          fontSize: 13.0,
          fontWeight: FontWeight.w400,
          height: 1.5,
          letterSpacing: 0.1,
          color: KColors.textSecondary,
        );
      case KTextStyle.caption:
        return TextStyle(
          fontFamily: family,
          fontSize: _minThaiSize(12.0, locale),
          fontWeight: FontWeight.w400,
          height: 1.4,
          letterSpacing: 0.2,
          color: KColors.textSecondary,
        );
      case KTextStyle.label:
        return TextStyle(
          fontFamily: family,
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
          height: 1.3,
          letterSpacing: 0.5,
          color: KColors.textSecondary,
        );
      case KTextStyle.button:
        return TextStyle(
          fontFamily: family,
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          height: 1.2,
          letterSpacing: 0.3,
          color: KColors.textPrimary,
        );
      case KTextStyle.targetWord:
        return TextStyle(
          fontFamily: family,
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
          height: 1.2,
          letterSpacing: -0.25,
          color: KColors.brand500,
        );
      case KTextStyle.romanization:
        return TextStyle(
          fontFamily: 'IBMPlexSans', // Always Latin font for romanization
          fontSize: _minThaiSize(14.0, locale),
          fontWeight: FontWeight.w400,
          height: 1.4,
          letterSpacing: 0.3,
          color: KColors.textSecondary,
          fontStyle: FontStyle.italic,
        );
    }
  }
}
