import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/features/auth/application/auth_controller.dart';
import 'package:frontend/features/settings/application/settings_controller.dart';
import 'package:frontend/l10n/l10n_ext.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final user = ref.watch(authControllerProvider);
    final isGuest = user?.isGuest ?? false;
    final l10n = context.l10n;
    String labelFor(AppTextScale s) => switch (s) {
      AppTextScale.normal => l10n.textScaleNormal,
      AppTextScale.large => l10n.textScaleLarge,
      AppTextScale.xlarge => l10n.textScaleExtra,
    };

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SectionTitle(l10n.textSize),
          SegmentedButton<AppTextScale>(
            segments: [
              for (final s in AppTextScale.values)
                ButtonSegment(value: s, label: Text(labelFor(s))),
            ],
            selected: {settings.textScale},
            showSelectedIcon: false,
            onSelectionChanged: (selection) =>
                ref.read(settingsProvider.notifier).setTextScale(selection.first),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                l10n.previewText,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          const Divider(height: 40),

          _SectionTitle(l10n.theme),
          SegmentedButton<ThemeMode>(
            segments: [
              ButtonSegment(
                value: ThemeMode.system,
                label: Text(l10n.themeSystem),
                icon: const Icon(Icons.brightness_auto),
              ),
              ButtonSegment(
                value: ThemeMode.light,
                label: Text(l10n.themeLight),
                icon: const Icon(Icons.light_mode),
              ),
              ButtonSegment(
                value: ThemeMode.dark,
                label: Text(l10n.themeDark),
                icon: const Icon(Icons.dark_mode),
              ),
            ],
            selected: {settings.themeMode},
            showSelectedIcon: false,
            onSelectionChanged: (selection) =>
                ref.read(settingsProvider.notifier).setThemeMode(selection.first),
          ),
          const Divider(height: 40),

          _SectionTitle(l10n.language),
          SegmentedButton<AppLanguage>(
            segments: [
              ButtonSegment(
                value: AppLanguage.persian,
                label: Text(l10n.persian),
              ),
              ButtonSegment(
                value: AppLanguage.english,
                label: Text(l10n.english),
              ),
            ],
            selected: {settings.language},
            showSelectedIcon: false,
            onSelectionChanged: (selection) => ref
                .read(settingsProvider.notifier)
                .setLanguage(selection.first),
          ),
          const Divider(height: 40),

          _SectionTitle(l10n.account),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.person_outline),
            title: Text(isGuest ? l10n.guest : (user?.displayName ?? l10n.account)),
            subtitle: Text(isGuest ? l10n.guestAccount : (user?.email ?? '')),
          ),
          if (user?.isAdmin ?? false) ...[
            const Divider(height: 32),
            _SectionTitle(l10n.adminSection),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.dashboard, color: Colors.amber),
                    title: Text(l10n.dashboard),
                    subtitle: Text(l10n.dashboardSubtitle),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => context.push('/admin'),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.shield, color: Colors.amber),
                    title: Text(l10n.manageUsers),
                    subtitle: Text(l10n.manageUsersSubtitle),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => context.push('/admin/users'),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.category, color: Colors.amber),
                    title: Text(l10n.manageCategories),
                    subtitle: Text(l10n.manageCategoriesSubtitle),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => context.push('/admin/categories'),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 12),
          FilledButton.tonalIcon(
            onPressed: () async {
              await ref.read(authControllerProvider.notifier).signOut();
              if (context.mounted) context.go('/welcome');
            },
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(56),
            ),
            icon: const Icon(Icons.logout),
            label: Text(l10n.signOut),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}
