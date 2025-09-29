part of 'settings_bloc.dart';

abstract class SettingsEvent {}

class GetThemeEvent implements SettingsEvent{}

class ToggleThemeEvent implements SettingsEvent{}

class GetLocaleEvent implements SettingsEvent{}

class ChangeLocaleEvent implements SettingsEvent{
  final Locale locale;
  const ChangeLocaleEvent(this.locale);
}


class LoadSettingdEvent implements SettingsEvent{}

