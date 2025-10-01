import 'package:dartz/dartz.dart';
import 'package:resume_app/domain/entities/experience_model.dart';
import 'package:resume_app/domain/exceptions/failure.dart';
import 'package:resume_app/domain/repositories/experience_repository.dart';
import 'package:resume_app/domain/usecases/usecase.dart';

class GetAllExperienceUsecase implements UseCase<String, List<ExperienceModel>> {

  final ExperienceRepository repo;

  const GetAllExperienceUsecase({required this.repo});

  @override
  Future<Either<Failure, List<ExperienceModel>>> call(String params) {
    return repo.getAllExperience(params);
  }

}