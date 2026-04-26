import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoka_app/core/theme/tokens.dart';

final offlineBannerVisibleProvider = StateProvider<bool>((ref) => true);

class OfflineBanner extends ConsumerWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visible = ref.watch(offlineBannerVisibleProvider);
    if (!visible) return const SizedBox.shrink();

    final bg   = KColors.warning500.withOpacity(0.15);
    final fg   = KColors.warning700;

    return SizedBox(
      height: 32,
      width: double.infinity,
      child: ColoredBox(
        color: bg,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '📡 Offline mode — words synced locally',
                  style: TextStyle(
                    fontSize: 12,
                    color: fg,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                onTap: () =>
                    ref.read(offlineBannerVisibleProvider.notifier).state = false,
                child: Icon(Icons.close, size: 16, color: fg),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
