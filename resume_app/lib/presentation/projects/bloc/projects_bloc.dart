import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:resume_app/data/sharedpreferences/preferences_datasource.dart';
import 'package:resume_app/domain/entities/project_model.dart';
import 'package:resume_app/domain/usecases/projects/get_all_projects_usecase.dart';
import 'package:resume_app/utils/ui_state.dart';

part 'projects_event.dart';
part 'projects_state.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  final GetAllProjectsUsecase getAllProjectsUsecase;

  ProjectsBloc(
    this.getAllProjectsUsecase
  ) : super(ProjectsState(uiState: UIState.idle(), projectList: [])) {
    on<ProjectsEvent>((event, emit) {
      // implement event handler
    });

    on<OnLoadProjects>((event, emit) async {
      emit(state.copyWith(uiState: UIState.loading()));

      var res = await getAllProjectsUsecase.call(NoParams());

      res.fold(
        (failure) => emit(state.copyWith(uiState: UIState.error(failure.message))),
        (projects) => emit(state.copyWith(projectList: projects, uiState: UIState.success()))
      );
    });
  }
}
