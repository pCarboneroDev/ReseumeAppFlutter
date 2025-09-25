import 'package:dartz/dartz.dart';
import 'package:resume_app/domain/exceptions/failure.dart';
import 'package:resume_app/domain/repositories/preferences_repository.dart';
import 'package:resume_app/domain/usecases/usecase.dart';

class SetDarkModeUsecase extends UseCase<bool, bool>{
  final PreferencesRepository repo;

  SetDarkModeUsecase(this.repo);

  @override
  Future<Either<Failure, bool>> call(bool params) {
    return repo.setDarkMode(params);
  }

}