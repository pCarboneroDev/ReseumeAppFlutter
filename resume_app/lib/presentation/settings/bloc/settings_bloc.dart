import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:resume_app/domain/entities/no_params.dart';
import 'package:resume_app/domain/entities/theme_entity.dart';
import 'package:resume_app/domain/exceptions/failure.dart';
import 'package:resume_app/domain/usecases/language/save_locale_usecase.dart';
import 'package:resume_app/domain/usecases/preferences/get_locale_usecase.dart';
import 'package:resume_app/domain/usecases/preferences/get_theme_usecase.dart';
import 'package:resume_app/domain/usecases/preferences/save_theme_usecase.dart';
import 'package:resume_app/utils/ui_state.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {

  final GetThemeUsecase getThemeUsecase;
  final SaveThemeUsecase saveThemeUsecase;
  final GetLocaleUsecase getLocaleUsecase;
  final SaveLocaleUsecase saveLocaleUsecase;


  SettingsBloc(
    this.getThemeUsecase,
    this.saveThemeUsecase,
    this.getLocaleUsecase,
    this.saveLocaleUsecase
  ) : super(SettingsState(uiState: UIState.idle(), themeEntity: ThemeEntity(theme: ThemeType.light), locale: Locale('en'))) {

    on<SettingsEvent>((event, emit) {
      // TODO: implement event handler
    });


    on<GetThemeEvent>((event, emit) async {
      emit(state.copyWith(uiState: UIState.loading()));
      
      var result = await getThemeUsecase.call(NoParams());

      result.fold(
        (failure) => emit(state.copyWith(uiState: UIState.error(failure.message))), 
        (theme) => emit(state.copyWith(uiState: UIState.success(), themeEntity: theme))
      );
    });


    on<ToggleThemeEvent>((event, emit) async {
      var newTheme = state.themeEntity.theme == ThemeType.dark ? ThemeEntity(theme: ThemeType.light) : ThemeEntity(theme: ThemeType.dark);

      saveThemeUsecase.call(newTheme);

      emit(state.copyWith(uiState: UIState.success(), themeEntity: newTheme));
    });

    on<LoadSettingdEvent>((event, emit) async {
      emit(state.copyWith(uiState: UIState.loading()));

      var themeFuture = getThemeUsecase.call(NoParams());
      var localeFuture = getLocaleUsecase.call(NoParams());

      final results = await Future.wait([themeFuture, localeFuture]);

      final Either<Failure, ThemeEntity> theme = results[0] as Either<Failure, ThemeEntity>;
      final Either<Failure, Locale> locale = results[1] as Either<Failure, Locale>;


      theme.fold(
        (fail) => emit(state.copyWith(uiState: UIState.error(fail.message))),
        (theme) => emit(state.copyWith(themeEntity: theme))
      );

      locale.fold(
        (fail) => emit(state.copyWith(uiState: UIState.error(fail.message))),
        (locale) => emit(state.copyWith(uiState: UIState.success(), locale: locale))
      );

    });


    on<ChangeLocaleEvent>((event, emit) {
      emit(state.copyWith(uiState: UIState.loading()));

      saveLocaleUsecase.call(event.locale);

      emit(state.copyWith(uiState: UIState.success(), locale: event.locale));
    });

  }
}
