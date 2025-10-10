import 'package:dartz/dartz.dart';
import 'package:resume_app/data/api_datasource.dart';
import 'package:resume_app/domain/entities/about_model.dart';
import 'package:resume_app/domain/exceptions/failure.dart';
import 'package:resume_app/domain/repositories/about_repository.dart';

class AboutRepositoryImpl implements AboutRepository {
  @override
  Future<Either<Failure, AboutModel>> getAbout(String lang) async {
    return await ApiDatasource.getAbout(lang);
  }
}