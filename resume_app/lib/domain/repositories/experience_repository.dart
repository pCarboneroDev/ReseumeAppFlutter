import 'package:dartz/dartz.dart';
import 'package:resume_app/domain/entities/experience_model.dart';
import 'package:resume_app/domain/exceptions/failure.dart';

abstract class ExperienceRepository {
  Future<Either<Failure, List<ExperienceModel>>> getAllExperience(String lang);
}