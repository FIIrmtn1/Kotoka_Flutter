import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleNotifier extends Notifier<Locale?> {
  static const _key = 'app_locale';
  static const _supported = ['en', 'th', 'zh', 'es', 'vi', 'lo'];

  @override
  Locale? build() {
    _loadFromPrefs();
    return null;
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_key);
    if (code != null) {
      state = Locale(code);
    } else {
      // First launch: mirror device language if supported, else English
      state = _deviceLocale();
    }
  }

  Locale _deviceLocale() {
    final code = ui.PlatformDispatcher.instance.locale.languageCode;
    return Locale(_supported.contains(code) ? code : 'en');
  }

  Future<void> setLocale(Locale locale) async {
    state = locale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, locale.languageCode);
  }
}

final localeProvider =
    NotifierProvider<LocaleNotifier, Locale?>(LocaleNotifier.new);
