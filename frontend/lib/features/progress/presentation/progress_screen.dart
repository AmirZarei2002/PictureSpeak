import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/core/widgets/error_retry.dart';
import 'package:frontend/features/progress/application/progress_providers.dart';
import 'package:frontend/features/progress/data/progress_summary.dart';
import 'package:frontend/l10n/l10n_ext.dart';

class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(progressSummaryProvider);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.progress)),
      body: summaryAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => ErrorRetry(
          message: context.l10n.progressLoadError,
          onRetry: () => ref.invalidate(progressSummaryProvider),
        ),
        data: (summary) {
          return RefreshIndicator(
            onRefresh: () => ref.refresh(progressSummaryProvider.future),
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              children: [
                Row(
                  children: [
                    _StatCard(
                      label: context.l10n.wordsExplored,
                      value: context.localizedNumber(summary.itemsExplored),
                      icon: Icons.explore_outlined,
                    ),
                    const SizedBox(width: 12),
                    _StatCard(
                      label: context.l10n.timesListened,
                      value: context.localizedNumber(summary.totalListens),
                      icon: Icons.volume_up_outlined,
                    ),
                  ],
                ).animate().fadeIn(duration: 320.ms).slideY(begin: -0.12, end: 0),
                const SizedBox(height: 24),
                if (summary.itemsExplored == 0)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Text(
                      context.l10n.progressEmpty,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                for (var i = 0; i < summary.byCategory.length; i++)
                  _CategoryBar(progress: summary.byCategory[i])
                      .animate()
                      .fadeIn(delay: (80 * i).ms, duration: 300.ms)
                      .slideX(begin: 0.08, end: 0),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Expanded(
      child: Card(
        color: colors.primaryContainer.withValues(alpha: 0.5),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: colors.primary),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
              Text(label, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryBar extends StatelessWidget {
  const _CategoryBar({required this.progress});

  final CategoryProgress progress;

  @override
  Widget build(BuildContext context) {
    final done = progress.total > 0 && progress.explored >= progress.total;
    final fraction = progress.total == 0
        ? 0.0
        : progress.explored / progress.total;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  progress.categoryName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (done)
                const Icon(Icons.check_circle, color: Colors.green, size: 20),
              const SizedBox(width: 6),
              Text(
                context.l10n.exploredOfTotal(progress.explored, progress.total),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: fraction),
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeOutCubic,
              builder: (context, value, _) =>
                  LinearProgressIndicator(value: value, minHeight: 12),
            ),
          ),
        ],
      ),
    );
  }
}
