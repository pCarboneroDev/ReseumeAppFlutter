class ProjectModel {
  final String name;
  final String description;
  final String imageUrl;
  final String? projectUrl;

  const ProjectModel({
    required this.name,
    required this.description,
    required this.imageUrl,
    this.projectUrl
  });
}