import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:resume_app/domain/entities/about_model.dart';
import 'package:resume_app/domain/usecases/about/get_about_usecase.dart';
import 'package:resume_app/utils/ui_state.dart';
part 'about_me_event.dart';
part 'about_me_state.dart';

class AboutMeBloc extends Bloc<AboutMeEvent, AboutMeState> {
  final GetAboutUsecase getAboutUsecase;
  Timer? _loadingTimer;

  AboutMeBloc(
    this.getAboutUsecase
  ) : super(AboutMeState(uiState: UIState.idle(), about: AboutModel.empty(), selectedList: [])) {
    on<AboutMeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadAboutEvent>((event, emit) async {
      emit(state.copyWith(uiState: UIState.loading()));

      _startTimer();

      var result = await getAboutUsecase.call(event.lang);

      _stopTimer();

      result.fold(
        (fail) => emit(state.copyWith(uiState: UIState.error(fail.message))),
        (about) => emit(state.copyWith(uiState: UIState.success(), about: about, selectedList: about.languages, showTimerText: false))
      );
    });

    on<ChangeListEvent>((event, emit) {
      emit(state.copyWith(selectedList: event.newList));
    });

    on<ShowTimerTextEvent>((event, emit) {
      emit(state.copyWith(showTimerText: true));
    });
  }

  void _startTimer() {
    _loadingTimer?.cancel();
    _loadingTimer = Timer(const Duration(seconds: 5), handleTimeout);
  }

  void _stopTimer() {
    _loadingTimer?.cancel();  
    _loadingTimer = null;
  }


  void handleTimeout() {  
    add(ShowTimerTextEvent());
  }
}
