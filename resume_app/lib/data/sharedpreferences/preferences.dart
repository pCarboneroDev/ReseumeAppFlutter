import 'package:dartz/dartz.dart';
import 'package:resume_app/domain/exceptions/Failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static bool _isDarkmode = false;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }


  static bool get isDarkmode{
    return _prefs.getBool('isDarkmode') ?? _isDarkmode;
  }

  static Future<Either<Failure, bool>> setDarkMode(bool darkmode) async {
    try{
      _isDarkmode = darkmode;
      _prefs.setBool('isDarkmode', darkmode);
      return Right(darkmode);
    }
    catch(e){
      return Left(DataSourceException((e.toString())));
    }
  }
}