import 'package:get_it/get_it.dart';
import 'package:resume_app/domain/usecases/preferences/set_dark_mode_usecase.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  getIt.registerLazySingleton(() => SetDarkModeUsecase(getIt()));
}
