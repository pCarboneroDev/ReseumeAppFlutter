import 'package:dartz/dartz.dart';
import 'package:resume_app/domain/exceptions/failure.dart';
import 'package:resume_app/domain/repositories/preferences_repository.dart';
import 'package:resume_app/domain/usecases/usecase.dart';

class SaveLocaleUsecase implements UseCase{
  final PreferencesRepository repo;

  const SaveLocaleUsecase({required this.repo});

  @override
  Future<Either<Failure, dynamic>> call(params) {
    return repo.saveLocale(params);
  }

}