import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:resume_app/data/sharedpreferences/preferences_datasource.dart';
import 'package:resume_app/domain/entities/theme_entity.dart';
import 'package:resume_app/domain/exceptions/failure.dart';
import 'package:resume_app/domain/repositories/preferences_repository.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {

  final PreferencesDatasource datasource;

  PreferencesRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, ThemeEntity>> getTheme() async {
    return await datasource.getTheme(); 
  }

  @override
  Future<Either<Failure, void>> saveTheme(ThemeEntity theme) async {
    return await datasource.saveTheme(theme);
  }

  @override
  Future<Either<Failure, Locale>> getLocale() async {
    return await datasource.getLanguage();
  }
  
  @override
  Future<Either<Failure, void>> saveLocale(Locale locale) async {
    return await datasource.saveLanguage(locale);
  }

}