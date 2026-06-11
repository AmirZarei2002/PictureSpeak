import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/features/favorites/application/favorites_providers.dart';
import 'package:frontend/l10n/l10n_ext.dart';

class FavoriteButton extends ConsumerWidget {
  const FavoriteButton({
    super.key,
    required this.itemId,
    this.size = 28,
    this.color,
  });

  final String itemId;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(
      favoriteIdsProvider.select(
        (s) => s.value?.contains(itemId) ?? false,
      ),
    );
    final l10n = context.l10n;

    return IconButton(
      iconSize: size,
      tooltip: isFavorite ? l10n.removeFromFavorites : l10n.addToFavorites,
      icon:
          Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: color ?? (isFavorite ? Colors.redAccent : null),
          ).animate(key: ValueKey(isFavorite)).scale(
            begin: const Offset(0.5, 0.5),
            end: const Offset(1, 1),
            duration: 280.ms,
            curve: Curves.elasticOut,
          ),
      onPressed: () async {
        final controller = ref.read(favoriteIdsProvider.notifier);
        final wasFavorite = isFavorite;
        try {
          await controller.toggle(itemId);
          if (wasFavorite && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(l10n.removedFromFavorites),
                action: SnackBarAction(
                  label: l10n.undo,
                  onPressed: () => controller.toggle(itemId),
                ),
              ),
            );
          }
        } catch (_) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.favoriteUpdateError)),
            );
          }
        }
      },
    );
  }
}

class FavoriteBadge extends StatelessWidget {
  const FavoriteBadge({super.key, required this.itemId});

  final String itemId;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.28),
        shape: BoxShape.circle,
      ),
      child: FavoriteButton(itemId: itemId, size: 22, color: Colors.white),
    );
  }
}
