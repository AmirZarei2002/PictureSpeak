import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/features/auth/application/auth_controller.dart';
import 'package:frontend/l10n/app_localizations.dart';
import 'package:frontend/l10n/l10n_ext.dart';

final _strongPassword = RegExp(
  r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
);

class RegisterScreen extends HookConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isLoading = useState(false);
    final errorText = useState<String?>(null);
    final l10n = context.l10n;

    Future<void> submit() async {
      errorText.value = null;
      if (!formKey.currentState!.validate()) return;
      isLoading.value = true;
      try {
        final name = nameController.text.trim();
        await ref
            .read(authControllerProvider.notifier)
            .register(
              email: emailController.text.trim(),
              password: passwordController.text,
              displayName: name.isEmpty ? null : name,
            );
        if (context.mounted) context.go('/home');
      } on DioException catch (e) {
        errorText.value = _friendlyError(e, l10n);
      } catch (_) {
        errorText.value = l10n.genericError;
      } finally {
        if (context.mounted) isLoading.value = false;
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(l10n.createAccount)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: nameController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: l10n.displayNameOptional,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: l10n.emailLabel),
                  validator: (value) {
                    final v = value?.trim() ?? '';
                    if (v.isEmpty) return l10n.emailRequired;
                    if (!v.contains('@')) return l10n.emailInvalid;
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: l10n.passwordLabel,
                    helperText: l10n.passwordHelper,
                    helperMaxLines: 2,
                  ),
                  validator: (value) {
                    final v = value ?? '';
                    if (v.isEmpty) return l10n.passwordChoose;
                    if (!_strongPassword.hasMatch(v)) {
                      return l10n.passwordWeak;
                    }
                    return null;
                  },
                ),
                if (errorText.value != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    errorText.value!,
                    style: TextStyle(color: Theme.of(context).colorScheme.error),
                  ),
                ],
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: isLoading.value ? null : submit,
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(64),
                  ),
                  child: isLoading.value
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(l10n.createAccount),
                ),
              ],
            ).animate().fadeIn(duration: 350.ms).slideY(begin: 0.06, end: 0),
          ),
        ),
      ),
    );
  }
}

String _friendlyError(DioException e, AppLocalizations l10n) {
  final code = e.response?.statusCode;
  if (code == 409) {
    return l10n.emailTaken;
  }
  if (code == 400) {
    return l10n.checkDetails;
  }
  if (e.type == DioExceptionType.connectionTimeout ||
      e.type == DioExceptionType.receiveTimeout ||
      e.type == DioExceptionType.connectionError) {
    return l10n.serverUnreachable;
  }
  return l10n.genericError;
}
