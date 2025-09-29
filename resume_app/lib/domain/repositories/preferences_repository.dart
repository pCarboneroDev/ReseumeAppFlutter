import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:resume_app/domain/entities/theme_entity.dart';
import 'package:resume_app/domain/exceptions/failure.dart';

abstract class PreferencesRepository {
  Future<Either<Failure, ThemeEntity>> getTheme();
  Future<Either<Failure, void>> saveTheme(ThemeEntity theme);

  Future<Either<Failure, Locale>> getLocale();
  Future<Either<Failure, void>> saveLocale(Locale locale);
}