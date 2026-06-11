import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/app/router.dart';
import 'package:frontend/core/storage/local_store.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/features/settings/application/settings_controller.dart';
import 'package:frontend/l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final store = await LocalStore.open();
  runApp(
    ProviderScope(
      overrides: [localStoreProvider.overrideWithValue(store)],
      child: const PictureSpeakApp(),
    ),
  );
}

class PictureSpeakApp extends ConsumerWidget {
  const PictureSpeakApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    final fontFamily = settings.language == AppLanguage.persian
        ? 'Vazirmatn'
        : null;

    return MaterialApp.router(
      title: 'PictureSpeak',
      debugShowCheckedModeBanner: false,
      locale: settings.language.locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.light(fontFamily: fontFamily),
      darkTheme: AppTheme.dark(fontFamily: fontFamily),
      themeMode: settings.themeMode,
      routerConfig: appRouter,
      builder: (context, child) {
        return MediaQuery.withClampedTextScaling(
          minScaleFactor: settings.textScale.factor,
          maxScaleFactor: settings.textScale.factor,
          child: child!,
        );
      },
    );
  }
}
