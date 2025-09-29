import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:resume_app/domain/exceptions/failure.dart';
import 'package:resume_app/domain/repositories/preferences_repository.dart';
import 'package:resume_app/domain/usecases/usecase.dart';

class GetCurrentLocaleUsecase implements UseCase<void, Locale> {
  final PreferencesRepository repo;

  GetCurrentLocaleUsecase(this.repo);

  @override
  Future<Either<Failure, Locale>> call(void params) async {
    return repo.getLocale();
  }

}