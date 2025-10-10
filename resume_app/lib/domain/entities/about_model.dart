import 'package:resume_app/domain/entities/skill_model.dart';

class AboutModel {
  final String name;
  final String profilePicture;
  final String role;
  final String shortDescription;
  final List<String> languages;
  final List<String> frameworks;
  final List<String> other;
  final List<SkillModel> skills;

  AboutModel({required this.name, required this.profilePicture, required this.role, required this.shortDescription, required this.languages, required this.frameworks, required this.other, required this.skills});

  factory AboutModel.empty() {
    return AboutModel(
      name: "", 
      profilePicture: "", 
      role: "", 
      shortDescription: "", 
      languages: [], 
      frameworks: [], 
      other: [], 
      skills: []
    );
  }
}
