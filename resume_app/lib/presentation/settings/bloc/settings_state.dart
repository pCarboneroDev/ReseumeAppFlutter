part of 'settings_bloc.dart';

class SettingsState extends Equatable {

  final bool darkMode;

  const SettingsState({required this.darkMode});


  SettingsState copyWith({
    bool? darkMode
  }){
    return SettingsState(
      darkMode: darkMode ?? this.darkMode
    );
  }

  @override
  List<Object?> get props => [darkMode];
}

