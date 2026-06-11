import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/features/auth/application/auth_controller.dart';
import 'package:frontend/l10n/l10n_ext.dart';

class WelcomeScreen extends HookConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final colors = Theme.of(context).colorScheme;
    final l10n = context.l10n;

    Future<void> continueAsGuest() async {
      isLoading.value = true;
      try {
        await ref.read(authControllerProvider.notifier).signInAsGuest();
        if (context.mounted) context.go('/home');
      } catch (_) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.welcomeError)),
          );
        }
      } finally {
        if (context.mounted) isLoading.value = false;
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: colors.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.record_voice_over_rounded,
                    size: 72,
                    color: colors.onPrimaryContainer,
                  ),
                ),
              ).animate().scale(
                begin: const Offset(0.6, 0.6),
                end: const Offset(1, 1),
                duration: 550.ms,
                curve: Curves.elasticOut,
              ),
              const SizedBox(height: 28),
              Text(
                l10n.welcomeTagline,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ).animate().fadeIn(delay: 200.ms, duration: 450.ms),
              const SizedBox(height: 8),
              Text(
                l10n.welcomeSubtitle,
                textAlign: TextAlign.center,
                style: TextStyle(color: colors.onSurfaceVariant, fontSize: 16),
              ).animate().fadeIn(delay: 320.ms, duration: 450.ms),
              const SizedBox(height: 44),
              FilledButton(
                onPressed: isLoading.value ? null : continueAsGuest,
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(64),
                ),
                child: isLoading.value
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(l10n.continueAsGuest),
              ).animate().fadeIn(delay: 440.ms).slideY(begin: 0.3, end: 0),
              const SizedBox(height: 14),
              OutlinedButton(
                onPressed: isLoading.value ? null : () => context.push('/login'),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(64),
                ),
                child: Text(l10n.signIn),
              ).animate().fadeIn(delay: 540.ms).slideY(begin: 0.3, end: 0),
              const SizedBox(height: 14),
              OutlinedButton(
                onPressed: isLoading.value
                    ? null
                    : () => context.push('/register'),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(64),
                ),
                child: Text(l10n.createAccount),
              ).animate().fadeIn(delay: 640.ms).slideY(begin: 0.3, end: 0),
            ],
          ),
        ),
      ),
    );
  }
}
