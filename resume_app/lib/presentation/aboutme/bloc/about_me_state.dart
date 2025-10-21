part of 'about_me_bloc.dart';

class AboutMeState extends Equatable {
  final UIState uiState;
  final AboutModel about;
  final List<String> selectedList;
  final bool showTimerText;

  const AboutMeState({required this.uiState, required this.about, required this.selectedList, this.showTimerText = false});


  AboutMeState copyWith({
    UIState? uiState,
    AboutModel? about,
    List<String>? selectedList,
    bool? showTimerText
  }) => AboutMeState(
    uiState: uiState ?? this.uiState, 
    about: about ?? this.about,
    selectedList: selectedList ?? this.selectedList,
    showTimerText: showTimerText ?? this.showTimerText
  );


  @override
  List<Object> get props => [uiState, about, selectedList, showTimerText];
}

