import 'dart:convert';

import 'package:resume_app/domain/entities/skill_model.dart';

class SkillEntity {
  final String name;
  final String description;

  const SkillEntity ({
    required this.description,
    required this.name
  });

  factory SkillEntity.fromJson(String str) => SkillEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SkillEntity.fromMap(Map<String, dynamic> json) => SkillEntity(
    description: json["description"] ?? "",
    name: json["name"] ?? ""
  );

  Map<String, dynamic> toMap() => {
    "name" : name,
    "description": description,
  };
}

extension SkillEntityMapper on SkillEntity {
  SkillModel toModel() {
    return SkillModel(
      name: name,
      description: description
    );
  }
}