import 'package:dartz/dartz.dart';
import 'package:resume_app/domain/entities/theme_entity.dart';
import 'package:resume_app/domain/exceptions/Failure.dart';
import 'package:resume_app/domain/repositories/theme_repository.dart';
import 'package:resume_app/domain/usecases/usecase.dart';

class SaveThemeUsecase implements UseCase<ThemeEntity, void> {
  final ThemeRepository repo;

  SaveThemeUsecase({required this.repo});

  @override
  Future<Either<Failure, void>> call(ThemeEntity params) {
    return repo.saveTheme(params);
  }

}