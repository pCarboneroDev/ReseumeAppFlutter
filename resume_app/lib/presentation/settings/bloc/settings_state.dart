part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final UIState uiState;
  final ThemeEntity themeEntity;
  final Locale locale;

  const SettingsState({
    required this.uiState, 
    required this.themeEntity,
    required this.locale
  });

  SettingsState copyWith({
    UIState? uiState,
    ThemeEntity? themeEntity,
    Locale? locale
  }) => SettingsState(
    uiState: uiState ?? this.uiState, 
    themeEntity: themeEntity ?? this.themeEntity,
    locale: locale ?? this.locale
  );

  @override
  List<Object?> get props => [uiState, themeEntity, locale];
}

