import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:resume_app/domain/entities/about_model.dart';
import 'package:resume_app/domain/usecases/about/get_about_usecase.dart';
import 'package:resume_app/utils/ui_state.dart';
part 'about_me_event.dart';
part 'about_me_state.dart';

class AboutMeBloc extends Bloc<AboutMeEvent, AboutMeState> {
  final GetAboutUsecase getAboutUsecase;

  AboutMeBloc(
    this.getAboutUsecase
  ) : super(AboutMeState(uiState: UIState.idle(), about: AboutModel.empty(), selectedList: [])) {
    on<AboutMeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadAboutEvent>((event, emit) async {
      emit(state.copyWith(uiState: UIState.loading()));

      var result = await getAboutUsecase.call(event.lang);

      result.fold(
        (fail) => emit(state.copyWith(uiState: UIState.error(fail.message))),
        (about) => emit(state.copyWith(uiState: UIState.success(), about: about, selectedList: about.languages))
      );
    });

    on<ChangeListEvent>((event, emit) {
      emit(state.copyWith(selectedList: event.newList));
    });
  }
}
