import 'dart:convert';

import 'package:resume_app/domain/entities/experience_model.dart';

class ExperienceEntity {
  final String companyName;
  final String role;
  final String date;
  final String location;
  final List<String> description;
  final String companyLogo;

  const ExperienceEntity({
    required this.companyName,
    required this.role,
    required this.date,
    required this.location,
    required this.description,
    required this.companyLogo
  });

  factory ExperienceEntity.fromJson(String str) => ExperienceEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExperienceEntity.fromMap(Map<String, dynamic> json) => ExperienceEntity(
    companyName: json["name"] ?? "",
    role: json["role"] ?? "",
    date: json["date"] ?? "",
    location: json["location"] ?? "",
    description: (json["description"] as List<dynamic>?)?.map((item) => item.toString()).toList() ?? [],
    companyLogo: json["companyLogo"] ?? ""
  );

  Map<String, dynamic> toMap() => {
    "companyName": companyName,
    "role": role,
    "date": date,
    "location": location,
    "description": description,
    "companyLogo": companyLogo
  };
}

extension ExperienceEntityMapper on ExperienceEntity {
  ExperienceModel toModel() {
    return ExperienceModel(
      companyName: companyName, 
      role: role,
      date: date,
      location: location,
      description: description, 
      companyLogo: companyLogo
    );
  }
}
