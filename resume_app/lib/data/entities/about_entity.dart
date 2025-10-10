import 'dart:convert';

import 'package:resume_app/data/entities/skill_entity.dart';
import 'package:resume_app/domain/entities/about_model.dart';
import 'package:resume_app/domain/entities/skill_model.dart';

class AboutEntity {
  final String name;
  final String profilePicture;
  final String role;
  final String shortDescription;
  final String longDescription;
  final List<String> languages;
  final List<String> frameworks;
  final List<String> other;
  final List<SkillModel> skills;

  AboutEntity({required this.name, required this.profilePicture, required this.role, required this.shortDescription, required this.longDescription, required this.languages, required this.frameworks, required this.other, required this.skills});

  factory AboutEntity.fromJson(String str) => AboutEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AboutEntity.fromMap(Map<String, dynamic> json) => AboutEntity(
    name: json["name"] ?? "",
    role: json["role"] ?? "",
    profilePicture: json["profilePicture"] ?? "",
    shortDescription: json["shortDescription"] ?? "",
    longDescription: json["longDescription"] ?? "",
    languages: (json["languages"] as List<dynamic>?)?.map((item) => item.toString()).toList() ?? [],
    frameworks: (json["frameworks"] as List<dynamic>?)?.map((item) => item.toString()).toList() ?? [],
    other: (json["other"] as List<dynamic>?)?.map((item) => item.toString()).toList() ?? [],
    skills: (json["skills"] as List<dynamic>?)?.map((item) => SkillEntity.fromMap(item).toModel()).toList() ?? [], //The argument type 'List<dynamic>' can't be assigned to the parameter type 'List<SkillEntity>'.
  );

  Map<String, dynamic> toMap() => {
   /* "name": name,
    "role": role,
    "date": profilePicture,
    "location": shortDescription,
    "description": description,
    "companyLogo": companyLogo*/
  };
}

extension AboutEntityMapper on AboutEntity {
  AboutModel toModel() {
    return AboutModel(
      name: name,
      profilePicture: profilePicture,
      role: role,
      shortDescription: shortDescription,
      languages: languages,
      frameworks: frameworks,
      other: other,
      skills: skills
    );
  }
}
