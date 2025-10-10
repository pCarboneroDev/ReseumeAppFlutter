import 'package:resume_app/domain/entities/skill_detail_model.dart';

class AboutMeModel {
  final String description;
  final String profilePicture;
  final String name;
  final List<Map<String, String>> skills; 
  final List<SkillDatailModel> personalInterests;
  
  const AboutMeModel({
    required this.description,
    required this.name,
    required this.profilePicture,
    required this.skills,
    required this.personalInterests
  });
}