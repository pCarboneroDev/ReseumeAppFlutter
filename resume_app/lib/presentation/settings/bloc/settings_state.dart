part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final UIState uiState;
  final ThemeEntity themeEntity;

  const SettingsState({
    required this.uiState, 
    required this.themeEntity
  });

  SettingsState copyWith({
    UIState? state,
    ThemeEntity? themeEntity
  }) => SettingsState(
    uiState: state ?? this.uiState, 
    themeEntity: themeEntity ?? this.themeEntity
  );

  @override
  List<Object?> get props => [uiState, themeEntity];
}

