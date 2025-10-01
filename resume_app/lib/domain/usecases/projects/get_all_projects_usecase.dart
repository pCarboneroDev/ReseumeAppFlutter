import 'package:dartz/dartz.dart';
import 'package:resume_app/domain/entities/project_model.dart';
import 'package:resume_app/domain/exceptions/failure.dart';
import 'package:resume_app/domain/repositories/projects_repository.dart';
import 'package:resume_app/domain/usecases/usecase.dart';

class GetAllProjectsUsecase implements UseCase<String, List<ProjectModel>> {

  final ProjectsRepository repo;

  GetAllProjectsUsecase({required this.repo});


  @override
  Future<Either<Failure, List<ProjectModel>>> call(params) {
    return repo.getAllProjects(params);
  }
}