import 'package:flutter/material.dart';

/// Renders an emoji as a Twemoji PNG from local assets.
///
/// Converts the emoji string to its Twemoji codepoint filename by:
/// 1. Collecting Unicode code points from the string's runes
/// 2. Stripping variation selectors (U+FE0F)
/// 3. Converting each to lowercase hex and joining with '-'
class KokoEmoji extends StatelessWidget {
  const KokoEmoji({
    super.key,
    required this.emoji,
    this.size = 24.0,
  });

  final String emoji;
  final double size;

  static const String _assetBase = 'assets/twemoji';

  String _toCodepoint() {
    final codepoints = emoji.runes
        .where((r) => r != 0xFE0F)
        .map((r) => r.toRadixString(16).toLowerCase())
        .toList();
    return codepoints.join('-');
  }

  @override
  Widget build(BuildContext context) {
    final path = '$_assetBase/${_toCodepoint()}.png';
    return Image.asset(
      path,
      width: size,
      height: size,
      errorBuilder: (_, __, ___) =>
          Text(emoji, style: TextStyle(fontSize: size * 0.9)),
    );
  }
}

/// Renders a flag emoji as a Twemoji PNG with rounded corners.
/// Use this instead of KokoEmoji for all national flag emojis.
class KokoFlag extends StatelessWidget {
  const KokoFlag({
    super.key,
    required this.emoji,
    this.size = 24.0,
    this.radius = 4.0,
  });

  final String emoji;
  final double size;
  final double radius;

  static const String _assetBase = 'assets/twemoji';

  String _toCodepoint() {
    final codepoints = emoji.runes
        .where((r) => r != 0xFE0F)
        .map((r) => r.toRadixString(16).toLowerCase())
        .toList();
    return codepoints.join('-');
  }

  @override
  Widget build(BuildContext context) {
    final path = '$_assetBase/${_toCodepoint()}.png';
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.asset(
        path,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) =>
            Text(emoji, style: TextStyle(fontSize: size * 0.9)),
      ),
    );
  }
}
