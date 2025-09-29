import 'package:dartz/dartz.dart';
import 'package:resume_app/domain/entities/project_model.dart';
import 'package:resume_app/domain/exceptions/failure.dart';

abstract class ProjectsRepository {
  Future<Either<Failure, List<ProjectModel>>> getAllProjects();
}