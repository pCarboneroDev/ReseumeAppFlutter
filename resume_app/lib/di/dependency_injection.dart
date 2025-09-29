import 'package:get_it/get_it.dart';
import 'package:resume_app/data/repositories_impl/projects_repository_impl.dart';
import 'package:resume_app/data/repositories_impl/preferences_repository_impl.dart';
import 'package:resume_app/data/sharedpreferences/preferences_datasource.dart';
import 'package:resume_app/domain/repositories/projects_repository.dart';
import 'package:resume_app/domain/repositories/preferences_repository.dart';
import 'package:resume_app/domain/usecases/language/save_locale_usecase.dart';
import 'package:resume_app/domain/usecases/preferences/get_locale_usecase.dart';
import 'package:resume_app/domain/usecases/projects/get_all_projects_usecase.dart';
import 'package:resume_app/domain/usecases/preferences/get_theme_usecase.dart';
import 'package:resume_app/domain/usecases/preferences/save_theme_usecase.dart';
import 'package:resume_app/presentation/projects/bloc/projects_bloc.dart';
import 'package:resume_app/presentation/settings/bloc/settings_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  getIt.registerSingleton(await SharedPreferences.getInstance());
  getIt.registerSingleton(PreferencesDatasource(preferences: getIt()));
  
  getIt.registerSingleton<PreferencesRepository>(PreferencesRepositoryImpl(datasource: getIt()));
  getIt.registerSingleton<ProjectsRepository>(ProjectsRepositoryImpl());

  getIt.registerSingleton(GetThemeUsecase(repo: getIt()));
  getIt.registerSingleton(SaveThemeUsecase(repo: getIt()));
  getIt.registerSingleton(GetAllProjectsUsecase(repo: getIt()));
  getIt.registerSingleton(GetLocaleUsecase(repo: getIt()));
  getIt.registerSingleton(SaveLocaleUsecase(repo: getIt()));

  getIt.registerSingleton(SettingsBloc(getIt(), getIt(), getIt(), getIt()));
  getIt.registerSingleton(ProjectsBloc(getIt()));
}
