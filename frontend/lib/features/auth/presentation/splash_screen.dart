import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/features/auth/application/auth_controller.dart';
import 'package:frontend/l10n/l10n_ext.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;

    useEffect(() {
      Future<void> decide() async {
        final restored = await ref
            .read(authControllerProvider.notifier)
            .tryRestoreSession();
        if (!context.mounted) return;
        if (!restored) {
          context.go('/welcome');
          return;
        }
        final user = ref.read(authControllerProvider);
        context.go(user?.isAdmin ?? false ? '/admin' : '/home');
      }

      decide();
      return null;
    }, const []);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.record_voice_over_rounded,
              size: 88,
              color: colors.primary,
            ).animate().scale(
              begin: const Offset(0.7, 0.7),
              end: const Offset(1, 1),
              duration: 600.ms,
              curve: Curves.easeOutBack,
            ),
            const SizedBox(height: 16),
            Text(
              context.l10n.appTitle,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ).animate().fadeIn(delay: 200.ms, duration: 400.ms),
            const SizedBox(height: 32),
            const SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(strokeWidth: 3),
            ).animate().fadeIn(delay: 400.ms),
          ],
        ),
      ),
    );
  }
}
