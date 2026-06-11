import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:frontend/core/widgets/offline_banner.dart';
import 'package:frontend/l10n/l10n_ext.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: Column(
        children: [
          const OfflineBanner(),
          Expanded(child: navigationShell),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(index),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: l10n.home,
          ),
          NavigationDestination(
            icon: const Icon(Icons.favorite_outline),
            selectedIcon: const Icon(Icons.favorite),
            label: l10n.favorites,
          ),
          NavigationDestination(
            icon: const Icon(Icons.insights_outlined),
            selectedIcon: const Icon(Icons.insights),
            label: l10n.progress,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            label: l10n.settings,
          ),
        ],
      ),
    );
  }
}
