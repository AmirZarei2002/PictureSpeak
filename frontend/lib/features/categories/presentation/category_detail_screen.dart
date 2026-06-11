import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/core/theme/hex_color.dart';
import 'package:frontend/core/widgets/error_retry.dart';
import 'package:frontend/features/categories/application/category_items_provider.dart';
import 'package:frontend/features/categories/data/category.dart';
import 'package:frontend/features/categories/presentation/item_tile.dart';
import 'package:frontend/features/learning/presentation/learning_card_screen.dart';
import 'package:frontend/l10n/l10n_ext.dart';

class CategoryDetailScreen extends ConsumerWidget {
  const CategoryDetailScreen({super.key, required this.slug, this.category});

  final String slug;
  final Category? category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsAsync = ref.watch(categoryItemsProvider(slug));
    final accent = category != null
        ? hexToColor(category!.colorHex)
        : Theme.of(context).colorScheme.primary;
    final title = category?.name ?? slug;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: itemsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => ErrorRetry(
          message: context.l10n.detailLoadError,
          onRetry: () => ref.invalidate(categoryItemsProvider(slug)),
        ),
        data: (items) {
          if (items.isEmpty) {
            return Center(
              child: Text(
                context.l10n.noItemsYet,
                style: const TextStyle(fontSize: 18),
              ),
            );
          }
          return Column(
            children: [
              _Header(accent: accent, count: items.length),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return ItemTile(
                      item: item,
                      accent: accent,
                      onTap: () => context.push(
                        '/card',
                        extra: CardDeckArgs(
                          items: items,
                          initialIndex: index,
                          title: title,
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

class _Header extends StatelessWidget {
  const _Header({required this.accent, required this.count});

  final Color accent;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [accent, Color.lerp(accent, Colors.black, 0.14)!],
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.confirmation_number_outlined, color: Colors.white),
          const SizedBox(width: 10),
          Text(
            context.l10n.wordsToExplore(count),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms).slideY(begin: -0.12, end: 0);
  }
}
