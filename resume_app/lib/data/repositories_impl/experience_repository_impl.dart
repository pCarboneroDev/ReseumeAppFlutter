import 'package:dartz/dartz.dart';
import 'package:resume_app/data/api_datasource.dart';
import 'package:resume_app/domain/entities/experience_model.dart';
import 'package:resume_app/domain/exceptions/failure.dart';
import 'package:resume_app/domain/repositories/experience_repository.dart';

class ExperienceRepositoryImpl implements ExperienceRepository {

  @override
  Future<Either<Failure, List<ExperienceModel>>> getAllExperience(lang) async {
    return await ApiDatasource.getAllExperience(lang);
  }

}