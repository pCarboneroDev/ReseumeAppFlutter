import 'dart:convert';

import 'package:resume_app/domain/entities/project_model.dart';

class ProjectEntity {
  final String name;
  final String description;
  final String imageUrl;
  final String? projectUrl;

  const ProjectEntity({
    required this.name,
    required this.description,
    required this.imageUrl,
    this.projectUrl
  });


  factory ProjectEntity.fromJson(String str) => ProjectEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProjectEntity.fromMap(Map<String, dynamic> json) => ProjectEntity(
    name: json["name"] ?? "",
    description: json["description"] ?? "",
    imageUrl: json["imageUrl"] ?? "",
    projectUrl: json["projectUrl"] ?? ""
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "description": description,
    "imageUrl": imageUrl,
    "projectUrl": projectUrl,
  };
}

extension ProjectEntityMapper on ProjectEntity {
  ProjectModel toModel() {
    return ProjectModel(
      name: name, 
      description: description, 
      imageUrl: imageUrl,
      projectUrl: projectUrl
    );
  }
}