import 'package:dartz/dartz.dart';
import 'package:resume_app/data/api_datasource.dart';
import 'package:resume_app/domain/entities/project_model.dart';
import 'package:resume_app/domain/exceptions/failure.dart';
import 'package:resume_app/domain/repositories/projects_repository.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  @override
  Future<Either<Failure, List<ProjectModel>>> getAllProjects(lang) async {
    return await ApiDatasource.getAllProjects(lang);
  }
}