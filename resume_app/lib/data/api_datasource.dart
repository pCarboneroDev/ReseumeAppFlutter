import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:resume_app/data/entities/about_entity.dart';
import 'package:resume_app/data/entities/contact_entity.dart';
import 'package:resume_app/data/entities/experience_entity.dart';
import 'package:resume_app/data/entities/project_entity.dart';
import 'package:resume_app/domain/entities/about_model.dart';
import 'package:resume_app/domain/entities/contact_model.dart';
import 'package:resume_app/domain/entities/experience_model.dart';
import 'package:resume_app/domain/entities/project_model.dart';
import 'package:http/http.dart' as http;
import 'package:resume_app/domain/exceptions/failure.dart';

class ApiDatasource {
  static final String apiUrl = "10.0.2.2:5050"; 
  static final String projectsEndpoint = 'projects';  
  static final String experienceEndpoint = 'experience';
  static final String contactEndpoint = 'contact';
  static final String aboutEndpoint = 'about';


  static Future<Either<Failure, List<ProjectModel>>> getAllProjects(lang) async {
    try {
      final uri = Uri.http(apiUrl, projectsEndpoint, {
        "lang": lang
      });

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


  static Future<Either<Failure, List<ExperienceModel>>> getAllExperience(lang) async {
    try{
      final uri = Uri.http(apiUrl, experienceEndpoint, {
        "lang": lang
      });

      var response = await http.get(uri); 

      if (response.statusCode == 200) {
        final List<dynamic> decodedJson = json.decode(response.body);

        final experience = decodedJson
            .map((item) => ExperienceEntity.fromMap(item).toModel())
            .toList();

        
        return Right(experience);
      }
      else {
        return Left(DataSourceException("Error: ${response.statusCode}"));
      }
    }
    catch(error){
      return Left(DataSourceException(error.toString()));
    } 
  }


  static Future<Either<Failure, List<ContactModel>>> getAllContacts(lang) async {
    try{
      final uri = Uri.http(apiUrl, contactEndpoint, {
        "lang": lang
      });

      var response = await http.get(uri); 

      if (response.statusCode == 200) {
        final List<dynamic> decodedJson = json.decode(response.body);

        final experience = decodedJson
            .map((item) => ContactEntity.fromMap(item).toModel())
            .toList();
        return Right(experience);
      }
      else {
        return Left(DataSourceException("Error: ${response.statusCode}"));
      }
    }
    catch(error){
      return Left(DataSourceException(error.toString()));
    } 
  }


  static Future<Either<Failure, AboutModel>> getAbout(lang) async {
    try{
      final uri = Uri.http(apiUrl, aboutEndpoint, {
        "lang": lang
      });

      var response = await http.get(uri); 

      if (response.statusCode == 200) {
        var decodedJson = json.decode(response.body);

        final about = AboutEntity.fromMap(decodedJson).toModel();
        return Right(about);
      }
      else {
        return Left(DataSourceException("Error: ${response.statusCode}"));
      }
    }
    catch(error){
      return Left(DataSourceException(error.toString()));
    } 
  }
}