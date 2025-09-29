import 'package:dartz/dartz.dart';
import 'package:resume_app/domain/entities/theme_entity.dart';
import 'package:resume_app/domain/exceptions/failure.dart';
import 'package:resume_app/domain/repositories/preferences_repository.dart';
import 'package:resume_app/domain/usecases/usecase.dart';

class GetThemeUsecase implements UseCase<void, ThemeEntity> {
  final PreferencesRepository repo;

  GetThemeUsecase({required this.repo});

  @override
  Future<Either<Failure, ThemeEntity>> call(params) {
    return repo.getTheme();
  }
}