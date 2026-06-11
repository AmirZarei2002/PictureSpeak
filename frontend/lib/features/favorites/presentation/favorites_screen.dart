import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/core/theme/hex_color.dart';
import 'package:frontend/core/widgets/error_retry.dart';
import 'package:frontend/core/widgets/media_image.dart';
import 'package:frontend/core/widgets/pressable.dart';
import 'package:frontend/features/favorites/application/favorites_providers.dart';
import 'package:frontend/features/favorites/data/favorite_item.dart';
import 'package:frontend/features/favorites/presentation/favorite_button.dart';
import 'package:frontend/features/learning/presentation/learning_card_screen.dart';
import 'package:frontend/l10n/l10n_ext.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAsync = ref.watch(favoritesListProvider);
    final ids = ref.watch(favoriteIdsProvider).value ?? const <String>{};

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.favorites)),
      body: listAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => ErrorRetry(
          message: context.l10n.favoritesLoadError,
          onRetry: () => ref.invalidate(favoritesListProvider),
        ),
        data: (all) {
          final favs = all.where((f) => ids.contains(f.itemId)).toList();
          if (favs.isEmpty) return const _EmptyFavorites();

          final deck = favs.map((f) => f.toLearningItem()).toList();
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: FilledButton.icon(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(60),
                  ),
                  onPressed: () => context.push(
                    '/card',
                    extra: CardDeckArgs(items: deck, title: context.l10n.favorites),
                  ),
                  icon: const Icon(Icons.play_arrow_rounded, size: 28),
                  label: Text(context.l10n.practiceAll),
                ).animate().fadeIn(duration: 300.ms).slideY(begin: -0.25, end: 0),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: favs.length,
                  itemBuilder: (context, index) {
                    final fav = favs[index];
                    return _FavoriteTile(
                      fav: fav,
                      onTap: () => context.push(
                        '/card',
                        extra: CardDeckArgs(
                          items: deck,
                          initialIndex: index,
                          title: context.l10n.favorites,
                        ),
                      ),
                    ).animate().fadeIn(delay: (50 * index).ms, duration: 300.ms).slideY(begin: 0.12, end: 0, curve: Curves.easeOutCubic);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _FavoriteTile extends StatelessWidget {
  const _FavoriteTile({required this.fav, required this.onTap});

  final FavoriteItem fav;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final accent = hexToColor(fav.categoryColorHex);

    return Pressable(
      onTap: onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: 'item-image-${fav.itemId}',
                    child: MediaImage(
                      path: fav.thumbnailPath ?? fav.imagePath,
                      fallbackColor: accent,
                      fallbackLabel: fav.itemName,
                    ),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: FavoriteBadge(itemId: fav.itemId),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fav.itemName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    fav.categoryName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyFavorites extends StatelessWidget {
  const _EmptyFavorites();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.favorite_border,
              size: 72,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              context.l10n.favoritesEmpty,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ).animate().fadeIn(duration: 400.ms).scale(begin: const Offset(0.95, 0.95)),
    );
  }
}
