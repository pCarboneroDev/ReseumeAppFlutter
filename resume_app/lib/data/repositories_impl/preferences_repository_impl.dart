import 'package:dartz/dartz.dart';
import 'package:resume_app/data/sharedpreferences/preferences.dart';
import 'package:resume_app/domain/exceptions/Failure.dart';
import 'package:resume_app/domain/repositories/preferences_repository.dart';

class PreferencesRepositoryImpl extends PreferencesRepository{
  @override
  Future<Either<Failure, bool>> setDarkMode(bool darkMode) async {
    return await Preferences.setDarkMode(darkMode);
  }
  
  @override
  Future<bool> getDarkMode() async {
    return Preferences.isDarkmode;
  }
}