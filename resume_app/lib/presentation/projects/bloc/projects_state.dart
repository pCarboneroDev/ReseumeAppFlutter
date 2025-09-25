part of 'projects_bloc.dart';

class ProjectsState extends Equatable {
  final UIState uiState;
  final List<ProjectModel> projectList;

  const ProjectsState({
    required this.uiState,
    required this.projectList
  });

  ProjectsState copyWith({
    UIState? uiState,
    List<ProjectModel>? projectList
  }) => ProjectsState(
    uiState: uiState ?? this.uiState,
    projectList: projectList ?? this.projectList
  );
  
  @override
  List<Object> get props => [uiState, projectList];
}
