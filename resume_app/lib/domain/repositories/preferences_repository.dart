import 'package:dartz/dartz.dart';
import 'package:resume_app/domain/exceptions/failure.dart';

abstract class PreferencesRepository {
  Future<Either<Failure, bool>> setDarkMode(bool darkMode);
  Future<bool> getDarkMode();
}