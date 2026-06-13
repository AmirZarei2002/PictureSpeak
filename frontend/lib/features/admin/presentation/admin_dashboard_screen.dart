import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/features/admin/application/analytics_controller.dart';
import 'package:frontend/features/admin/data/analytics.dart';
import 'package:frontend/features/auth/application/auth_controller.dart';
import 'package:frontend/l10n/l10n_ext.dart';

class AdminDashboardScreen extends ConsumerWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.adminDashboard),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(analyticsOverviewProvider);
              ref.invalidate(analyticsTopItemsProvider);
              ref.invalidate(analyticsActiveUsersProvider);
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: context.l10n.signOut,
            onPressed: () => _confirmSignOut(context, ref),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(analyticsOverviewProvider);
          ref.invalidate(analyticsTopItemsProvider);
          ref.invalidate(analyticsActiveUsersProvider);
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            _OverviewSection(),
            SizedBox(height: 24),
            _ActiveUsersSection(),
            SizedBox(height: 24),
            _TopItemsSection(),
            SizedBox(height: 24),
            _NavSection(),
          ],
        ),
      ),
    );
  }
}


class _OverviewSection extends ConsumerWidget {
  const _OverviewSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(analyticsOverviewProvider);
    final l10n = context.l10n;
    return async.when(
      loading: () => const _SectionLoading(),
      error: (e, _) => _SectionError(message: l10n.overviewFailed(e)),
      data: (o) => GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.7,
        children: [
          _StatCard(
            label: l10n.users,
            value: context.localizedNumber(o.totalUsers),
            sub: l10n.userBreakdown(o.registeredUsers, o.guestUsers),
            icon: Icons.people,
            color: Colors.blue,
          ),
          _StatCard(
            label: l10n.admins,
            value: context.localizedNumber(o.totalAdmins),
            icon: Icons.shield,
            color: Colors.amber,
          ),
          _StatCard(
            label: l10n.categories,
            value: context.localizedNumber(o.totalCategories),
            sub: l10n.activeCount(o.activeCategories),
            icon: Icons.category,
            color: Colors.purple,
          ),
          _StatCard(
            label: l10n.items,
            value: context.localizedNumber(o.totalItems),
            sub: l10n.activeCount(o.activeItems),
            icon: Icons.image,
            color: Colors.teal,
          ),
          _StatCard(
            label: l10n.progressRows,
            value: context.localizedNumber(o.totalProgressRows),
            icon: Icons.show_chart,
            color: Colors.indigo,
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
    this.sub,
  });

  final String label;
  final String value;
  final String? sub;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 20),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const Spacer(),
            Text(value, style: Theme.of(context).textTheme.headlineSmall),
            if (sub != null)
              Text(
                sub!,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
      ),
    );
  }
}


class _ActiveUsersSection extends ConsumerWidget {
  const _ActiveUsersSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(analyticsActiveUsersProvider);
    final l10n = context.l10n;
    return _SectionCard(
      title: l10n.activeUsers,
      child: async.when(
        loading: () => const _SectionLoading(),
        error: (e, _) => _SectionError(message: l10n.activeUsersFailed(e)),
        data: (a) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _Metric(label: l10n.dau, value: a.dau),
                _Metric(label: l10n.wau, value: a.wau),
                _Metric(label: l10n.mau, value: a.mau),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              l10n.dailyActiveLastDays(a.windowDays),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 90,
              child: _DauSparkline(series: a.series),
            ),
          ],
        ),
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric({required this.label, required this.value});

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.localizedNumber(value),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}

class _DauSparkline extends StatelessWidget {
  const _DauSparkline({required this.series});

  final List<DauPoint> series;

  @override
  Widget build(BuildContext context) {
    if (series.isEmpty) return Center(child: Text(context.l10n.noData));
    return CustomPaint(
      painter: _SparklinePainter(
        series: series,
        color: Theme.of(context).colorScheme.primary,
      ),
      child: const SizedBox.expand(),
    );
  }
}

class _SparklinePainter extends CustomPainter {
  _SparklinePainter({required this.series, required this.color});

  final List<DauPoint> series;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    if (series.length < 2) return;

    final maxVal = series.map((p) => p.count).fold<int>(0, (a, b) => a > b ? a : b);
    final ceiling = maxVal == 0 ? 1 : maxVal;
    final stepX = size.width / (series.length - 1);

    final path = Path();
    for (var i = 0; i < series.length; i++) {
      final x = i * stepX;
      final y = size.height - (series[i].count / ceiling) * size.height;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    final fillPath = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    final fillPaint = Paint()
      ..color = color.withValues(alpha: 0.15)
      ..style = PaintingStyle.fill;
    canvas.drawPath(fillPath, fillPaint);

    final linePaint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    canvas.drawPath(path, linePaint);

    final dotPaint = Paint()..color = color;
    for (var i = 0; i < series.length; i++) {
      final x = i * stepX;
      final y = size.height - (series[i].count / ceiling) * size.height;
      canvas.drawCircle(Offset(x, y), 2, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _SparklinePainter old) =>
      old.series != series || old.color != color;
}


class _TopItemsSection extends ConsumerWidget {
  const _TopItemsSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(analyticsTopItemsProvider);
    final l10n = context.l10n;
    return _SectionCard(
      title: l10n.topItemsByViews,
      child: async.when(
        loading: () => const _SectionLoading(),
        error: (e, _) => _SectionError(message: l10n.topItemsFailed(e)),
        data: (items) {
          if (items.isEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(l10n.noEngagementData),
            );
          }
          return Column(
            children: [
              for (var i = 0; i < items.length; i++)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  leading: CircleAvatar(
                    radius: 14,
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    child: Text(
                      context.localizedNumber(i + 1),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  title: Text(items[i].itemName),
                  subtitle: Text(items[i].categoryName),
                  trailing: Text(
                    l10n.viewsListens(items[i].totalViews, items[i].totalListens),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}


class _NavSection extends StatelessWidget {
  const _NavSection();

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: context.l10n.manage,
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.people),
            title: Text(context.l10n.users),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/admin/users'),
          ),
          const Divider(height: 1),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.category),
            title: Text(context.l10n.categoriesAndItems),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/admin/categories'),
          ),
        ],
      ),
    );
  }
}


class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 8),
            child,
          ],
        ),
      ),
    );
  }
}

class _SectionLoading extends StatelessWidget {
  const _SectionLoading();
  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Center(child: CircularProgressIndicator()),
      );
}

class _SectionError extends StatelessWidget {
  const _SectionError({required this.message});
  final String message;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(message, style: const TextStyle(color: Colors.red)),
      );
}

Future<void> _confirmSignOut(BuildContext context, WidgetRef ref) async {
  final l10n = context.l10n;
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(l10n.signOutQuestion),
      content: Text(l10n.signOutAdminBody),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(false),
          child: Text(l10n.cancel),
        ),
        FilledButton(
          onPressed: () => Navigator.of(ctx).pop(true),
          child: Text(l10n.signOut),
        ),
      ],
    ),
  );
  if (confirmed != true) return;
  await ref.read(authControllerProvider.notifier).signOut();
  if (context.mounted) context.go('/welcome');
}
