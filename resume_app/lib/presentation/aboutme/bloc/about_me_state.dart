part of 'about_me_bloc.dart';

class AboutMeState extends Equatable {
  final UIState uiState;
  final AboutModel about;
  final List<String> selectedList;

  const AboutMeState({required this.uiState, required this.about, required this.selectedList});


  AboutMeState copyWith({
    UIState? uiState,
    AboutModel? about,
    List<String>? selectedList
  }) => AboutMeState(
    uiState: uiState ?? this.uiState, 
    about: about ?? this.about,
    selectedList: selectedList ?? this.selectedList
  );


  @override
  List<Object> get props => [uiState, about, selectedList];
}

