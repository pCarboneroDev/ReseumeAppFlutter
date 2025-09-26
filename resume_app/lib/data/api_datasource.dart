import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:resume_app/data/entities/project_entity.dart';
import 'package:resume_app/domain/entities/project_model.dart';
import 'package:http/http.dart' as http;
import 'package:resume_app/domain/exceptions/failure.dart';

class ApiDatasource {
  static final String apiUrl = "10.0.2.2:5050"; 
  static final String projectsEndpoint = 'projects';  

  static Future<Either<Failure, List<ProjectModel>>> getAllProjects() async {
    try {
      final uri = Uri.http(apiUrl, projectsEndpoint);

      var response = await http.get(uri); 

      if (response.statusCode == 200) {
        final List<dynamic> decodedJson = json.decode(response.body);

        // Mapear cada item del JSON a un ProjectEntity y luego a ProjectModel
        final projects = decodedJson
            .map((item) => ProjectEntity.fromMap(item).toModel())
            .toList();

        return Right(projects);
      } else {
        return Left(DataSourceException("Error: ${response.statusCode}"));
      }
    }
    catch (error) {
      return Left(DataSourceException(error.toString()));
    }
  }
}