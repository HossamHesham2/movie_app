import 'package:flutter/cupertino.dart';
import 'package:movie_app/config/language/l10n/app_localizations.dart';

extension BuildContextExtension on BuildContext {
  AppLocalizations? get appLocalizations => AppLocalizations.of(this);
  Locale get locale => Localizations.localeOf(this);

  bool get isArabic => locale.languageCode == 'ar';
  bool get isEnglish => locale.languageCode == 'en';
}
