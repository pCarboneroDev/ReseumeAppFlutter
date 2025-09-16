import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:resume_app/data/sharedpreferences/preferences_datasource.dart';
import 'package:resume_app/domain/entities/theme_entity.dart';
import 'package:resume_app/domain/usecases/theme/get_theme_usecase.dart';
import 'package:resume_app/domain/usecases/theme/save_theme_usecase.dart';
import 'package:resume_app/utils/ui_state.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {

  final GetThemeUsecase getThemeUsecase;
  final SaveThemeUsecase saveThemeUsecase;

  SettingsBloc(
    this.getThemeUsecase,
    this.saveThemeUsecase
  ) : super(SettingsState(state: UIState.idle(), themeEntity: ThemeEntity(theme: ThemeType.light))) {

    on<SettingsEvent>((event, emit) {
      // TODO: implement event handler
    });


    on<GetThemeEvent>((event, emit) async {
      var result = await getThemeUsecase.call(NoParams());

      result.fold(
        (failure) => emit(state.copyWith(state: UIState.error(failure.message))), 
        (theme) => emit(state.copyWith(state: UIState.success(), themeEntity: theme))
      );
    });


    on<ToggleThemeEvent>((event, emit) async {
      var newTheme = state.themeEntity.theme == ThemeType.dark ? ThemeEntity(theme: ThemeType.light) : ThemeEntity(theme: ThemeType.dark);

      saveThemeUsecase.call(newTheme);

      emit(state.copyWith(state: UIState.success(), themeEntity: newTheme));
    });

    on<LoadSettingdEvent>((event, emit) async {
      emit(state.copyWith(state: UIState.success()));
    });

  }
}
