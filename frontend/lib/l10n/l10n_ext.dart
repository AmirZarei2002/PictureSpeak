import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'package:frontend/l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);

  String localizedNumber(num value) =>
      NumberFormat.decimalPattern(Localizations.localeOf(this).toLanguageTag())
          .format(value);
}