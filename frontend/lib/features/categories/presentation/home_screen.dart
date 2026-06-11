import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/core/widgets/error_retry.dart';
import 'package:frontend/features/auth/application/auth_controller.dart';
import 'package:frontend/features/categories/application/categories_provider.dart';
import 'package:frontend/features/categories/presentation/category_tile.dart';
import 'package:frontend/l10n/l10n_ext.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.appTitle)),
      body: categoriesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => ErrorRetry(
          message: context.l10n.homeLoadError,
          onRetry: () => ref.invalidate(categoriesProvider),
        ),
        data: (categories) {
          if (categories.isEmpty) {
            return Center(
              child: Text(
                context.l10n.noCategoriesYet,
                style: const TextStyle(fontSize: 18),
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref.refresh(categoriesProvider.future),
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                const SliverToBoxAdapter(child: _Greeting()),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  sliver: SliverGrid.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.8,
                        ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return CategoryTile(
                        category: category,
                        onTap: () => context.push(
                          '/home/category/${category.slug}',
                          extra: category,
                        ),
                      ).animate().fadeIn(delay: (60 * index).ms, duration: 320.ms).slideY(begin: 0.14, end: 0, curve: Curves.easeOutCubic);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Greeting extends ConsumerWidget {
  const _Greeting();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authControllerProvider);
    final hasName = user?.displayName?.trim().isNotEmpty ?? false;
    final textTheme = Theme.of(context).textTheme;
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hasName ? l10n.greetingNamed(user!.displayName!) : l10n.greeting,
            style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 2),
          Text(
            l10n.pickCategory,
            style: textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ).animate().fadeIn(duration: 350.ms).slideX(begin: -0.05, end: 0),
    );
  }
}
