import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kKey = 'koko_visible';

class _KokoVisibleNotifier extends Notifier<bool> {
  @override
  bool build() {
    _loadFromPrefs();
    return true;
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getBool(_kKey);
    if (saved != null) state = saved;
  }

  void toggle() => set(!state);

  void set(bool value) async {
    state = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kKey, value);
  }
}

final kokoVisibleProvider = NotifierProvider<_KokoVisibleNotifier, bool>(
  _KokoVisibleNotifier.new,
);
