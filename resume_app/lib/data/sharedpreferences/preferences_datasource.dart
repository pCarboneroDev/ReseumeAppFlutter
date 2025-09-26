import 'package:dartz/dartz.dart';
import 'package:resume_app/domain/entities/no_params.dart';
import 'package:resume_app/domain/entities/theme_entity.dart';
import 'package:resume_app/domain/exceptions/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesDatasource {
  final SharedPreferences preferences;

  PreferencesDatasource({required this.preferences});

  Future<Either<Failure, void>> saveTheme(ThemeEntity theme) async {
    try {
      var themeValue = theme.theme == ThemeType.dark ? 'dark' : 'light';
      await preferences.setString('theme_key', themeValue);  
      //print(preferences.getString('theme_key'));
      return Right(NoParams());
    }
    catch(e){
      return left(DataSourceException(e.toString()));
    }
  }

  Future<Either<Failure, ThemeEntity>> getTheme() async {
    try {
      var themeValue = preferences.getString('theme_key');
      if(themeValue == 'dark') {
        return Right(ThemeEntity(theme: ThemeType.dark));
      }
      else{
        return Right(ThemeEntity(theme: ThemeType.light));
      }
    }
    catch(e){
      return left(DataSourceException(e.toString()));
    }
  } 


  Future<Either<Failure, void>> saveLanguage(String langCode) async {
    try {
      await preferences.setString('language_key', langCode);  
      //print(preferences.getString('language_key'));
      return Right(NoParams());
    }
    catch(e){
      return left(DataSourceException(e.toString()));
    }
  }


  Future<Either<Failure, String>> getLanguage() async {
    try {
      var langValue = preferences.getString('language_key');
      if (langValue != null){
        return Right(langValue);
      }
      else{
        return Right('en');
      }
    }
    catch(e){
      return left(DataSourceException(e.toString()));
    }
  } 
}

