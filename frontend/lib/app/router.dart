import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:frontend/app/scaffold_with_nav_bar.dart';
import 'package:frontend/features/admin/data/admin_category.dart';
import 'package:frontend/features/admin/data/admin_item.dart';
import 'package:frontend/features/admin/presentation/admin_categories_screen.dart';
import 'package:frontend/features/admin/presentation/admin_category_form_screen.dart';
import 'package:frontend/features/admin/presentation/admin_dashboard_screen.dart';
import 'package:frontend/features/admin/presentation/admin_item_form_screen.dart';
import 'package:frontend/features/admin/presentation/admin_items_screen.dart';
import 'package:frontend/features/admin/presentation/admin_user_detail_screen.dart';
import 'package:frontend/features/admin/presentation/admin_users_screen.dart';
import 'package:frontend/features/auth/presentation/login_screen.dart';
import 'package:frontend/features/auth/presentation/register_screen.dart';
import 'package:frontend/features/auth/presentation/splash_screen.dart';
import 'package:frontend/features/auth/presentation/welcome_screen.dart';
import 'package:frontend/features/categories/data/category.dart';
import 'package:frontend/features/categories/presentation/category_detail_screen.dart';
import 'package:frontend/features/categories/presentation/home_screen.dart';
import 'package:frontend/features/favorites/presentation/favorites_screen.dart';
import 'package:frontend/features/learning/presentation/learning_card_screen.dart';
import 'package:frontend/features/progress/presentation/progress_screen.dart';
import 'package:frontend/features/settings/presentation/settings_screen.dart';
import 'package:frontend/l10n/l10n_ext.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/admin',
      builder: (context, state) => const AdminDashboardScreen(),
    ),
    GoRoute(
      path: '/admin/users',
      builder: (context, state) => const AdminUsersScreen(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) =>
              AdminUserDetailScreen(userId: state.pathParameters['id']!),
        ),
      ],
    ),
    GoRoute(
      path: '/admin/categories',
      builder: (context, state) => const AdminCategoriesScreen(),
      routes: [
        GoRoute(
          path: 'new',
          builder: (context, state) => const AdminCategoryFormScreen(),
        ),
        GoRoute(
          path: ':id/edit',
          builder: (context, state) => AdminCategoryFormScreen(
            existing: state.extra as AdminCategory?,
          ),
        ),
        GoRoute(
          path: ':id/items',
          builder: (context, state) => AdminItemsScreen(
            categoryId: state.pathParameters['id']!,
            category: state.extra as AdminCategory?,
          ),
          routes: [
            GoRoute(
              path: 'new',
              builder: (context, state) => AdminItemFormScreen(
                categoryId: state.pathParameters['id']!,
              ),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/admin/items/:id/edit',
      builder: (context, state) => AdminItemFormScreen(
        existing: state.extra as AdminItem?,
      ),
    ),
    GoRoute(
      path: '/card',
      pageBuilder: (context, state) {
        final args = state.extra as CardDeckArgs?;
        final child = (args == null || args.items.isEmpty)
            ? Scaffold(body: Center(child: Text(context.l10n.nothingToShow)))
            : LearningCardScreen(args: args);
        return CustomTransitionPage(
          key: state.pageKey,
          transitionDuration: const Duration(milliseconds: 320),
          transitionsBuilder: (context, animation, _, child) =>
              FadeTransition(opacity: animation, child: child),
          child: child,
        );
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeScreen(),
              routes: [
                GoRoute(
                  path: 'category/:slug',
                  builder: (context, state) {
                    final slug = state.pathParameters['slug']!;
                    final category = state.extra as Category?;
                    return CategoryDetailScreen(slug: slug, category: category);
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/favorites',
              builder: (context, state) => const FavoritesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/progress',
              builder: (context, state) => const ProgressScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              builder: (context, state) => const SettingsScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
