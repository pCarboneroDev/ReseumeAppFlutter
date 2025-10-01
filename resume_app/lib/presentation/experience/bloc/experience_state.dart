part of 'experience_bloc.dart';

class ExperienceState extends Equatable {
  final UIState uiState;
  final List<ExperienceModel> experienceList;

  const ExperienceState({
    required this.uiState,
    required this.experienceList
  });

  ExperienceState copyWith({
    UIState? uiState,
    List<ExperienceModel>? experienceList
  }) => ExperienceState(
    uiState: uiState ?? this.uiState, 
    experienceList: experienceList ?? this.experienceList
  );
  
  @override
  List<Object> get props => [uiState, experienceList];
}
