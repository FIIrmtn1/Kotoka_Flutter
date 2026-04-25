import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kKey = 'sensory_tooltip_seen';

class _TooltipSeenNotifier extends Notifier<bool> {
  @override
  bool build() {
    _loadFromPrefs();
    return false;
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getBool(_kKey);
    if (saved != null) state = saved;
  }

  void markSeen() async {
    state = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kKey, true);
  }
}

final tooltipSeenProvider = NotifierProvider<_TooltipSeenNotifier, bool>(
  _TooltipSeenNotifier.new,
);
