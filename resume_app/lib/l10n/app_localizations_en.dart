// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get projectsTitle => 'Projects';

  @override
  String get aboutTitle => 'About me';

  @override
  String get experienceTitle => 'Experience';

  @override
  String get contactTitle => 'Contact';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get modalButton => 'Read something about me!';

  @override
  String get skillsTitle => 'Know more about my skills';

  @override
  String get skillsSubtitle => 'Tap to see details about my skills';

  @override
  String get salutation => 'Hello, I am';

  @override
  String get languages => 'Languages';

  @override
  String get other => 'Other';

  @override
  String get appTheme => 'App theme';

  @override
  String get appLanguage => 'App language';

  @override
  String get dark => 'Dark';

  @override
  String get light => 'Light';

  @override
  String get errorTitle => 'Ups... Something went wrong';

  @override
  String get errorText =>
      'Check your internet connection or wait a couple of minutes. Maybe the server is initializing and is taking longer than expected!';
}
