import 'package:dartz/dartz.dart';
import 'package:resume_app/domain/entities/theme_entity.dart';
import 'package:resume_app/domain/exceptions/Failure.dart';

abstract class ThemeRepository {
  Future<Either<Failure, ThemeEntity>> getTheme();

  Future<Either<Failure, void>> saveTheme(ThemeEntity theme);
}