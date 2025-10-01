import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:resume_app/domain/entities/experience_model.dart';
import 'package:resume_app/domain/usecases/experience/get_all_experience_usecase.dart';
import 'package:resume_app/utils/ui_state.dart';

part 'experience_event.dart';
part 'experience_state.dart';

class ExperienceBloc extends Bloc<ExperienceEvent, ExperienceState> {

  final GetAllExperienceUsecase getAllExperienceUsecase;


  ExperienceBloc(
    this.getAllExperienceUsecase
  ) : super(ExperienceState(uiState: UIState.idle(), experienceList: [])) {
    on<ExperienceEvent>((event, emit) {
      // TODO: implement event handler
    });


    on<GetAllExperienceEvent>((event, emit) async {
      emit(state.copyWith(uiState: UIState.loading()));

      var result = await getAllExperienceUsecase.call(event.lang);

      result.fold(
        (fail) => emit(state.copyWith(uiState: UIState.error(fail.message))),
        (experience) => emit(state.copyWith(uiState: UIState.success(), experienceList: experience))
      );
    });
  }
}
