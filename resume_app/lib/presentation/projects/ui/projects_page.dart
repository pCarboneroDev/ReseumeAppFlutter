import 'package:flutter/material.dart';
import 'package:resume_app/domain/entities/project_model.dart';


class ProjectsPage extends StatelessWidget {

  final List<ProjectModel> projectList = [
    ProjectModel(
      name: "Android Guitar Tuner", 
      description: "Consequat incididunt pariatur enim ut Lorem eu ullamco amet enim cupidatat pariatur veniam. Laborum nostrud dolor dolore labore commodo. Aute veniam ex est voluptate labore cillum pariatur duis. Dolore non dolore cillum reprehenderit aute excepteur eiusmod amet irure elit. Dolore quis duis commodo tempor anim occaecat tempor sit dolore velit esse.", 
      imageUrl: 'https://pcarbonerodev.github.io/Carbonero-WebPortfolio/assets/images/androidTunerPreview.png', 
    ),
    ProjectModel(
      name: "Flutter Course Projects", 
      description: "Consequat incididunt pariatur enim ut Lorem eu ullamco amet enim cupidatat pariatur veniam. Laborum nostrud dolor dolore labore commodo. Aute veniam ex est voluptate labore cillum pariatur duis. Dolore non dolore cillum reprehenderit aute excepteur eiusmod amet irure elit. Dolore quis duis commodo tempor anim occaecat tempor sit dolore velit esse.", 
      imageUrl: 'https://pcarbonerodev.github.io/Carbonero-WebPortfolio/assets/images/androidTunerPreview.png', 
    ),
    ProjectModel(
      name: "Android Guitar Tuner", 
      description: "Consequat incididunt pariatur enim ut Lorem eu ullamco amet enim cupidatat pariatur veniam. Laborum nostrud dolor dolore labore commodo. Aute veniam ex est voluptate labore cillum pariatur duis. Dolore non dolore cillum reprehenderit aute excepteur eiusmod amet irure elit. Dolore quis duis commodo tempor anim occaecat tempor sit dolore velit esse.", 
      imageUrl: 'https://pcarbonerodev.github.io/Carbonero-WebPortfolio/assets/images/androidTunerPreview.png', 
    ),
    ProjectModel(
      name: "Android Guitar Tuner", 
      description: "Consequat incididunt pariatur enim ut Lorem eu ullamco amet enim cupidatat pariatur veniam. Laborum nostrud dolor dolore labore commodo. Aute veniam ex est voluptate labore cillum pariatur duis. Dolore non dolore cillum reprehenderit aute excepteur eiusmod amet irure elit. Dolore quis duis commodo tempor anim occaecat tempor sit dolore velit esse.", 
      imageUrl: 'https://pcarbonerodev.github.io/Carbonero-WebPortfolio/assets/images/androidTunerPreview.png', 
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projects'),
      ),
      body: ListView.builder(
        itemCount: projectList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: _ProjectCard(project: projectList[index]),
          );
        },
      )
   );
  }
}

class _ProjectCard extends StatelessWidget {

  final ProjectModel project;


  const _ProjectCard({
    super.key, required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorScheme.of(context).secondary,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(project.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text(project.description),
            Image(image: NetworkImage(project.imageUrl))
          ],
        ),
      ),
    );
  }
}