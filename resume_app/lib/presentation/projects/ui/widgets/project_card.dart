import 'package:flutter/material.dart';
import 'package:resume_app/domain/entities/project_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {

  final ProjectModel project;


  const ProjectCard({
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorScheme.of(context).primaryFixed,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: ColorScheme.of(context).onSurface,
          width: 2
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(project.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Divider(),
            Text(project.description),
            SizedBox(height: 5),
            //Image(image: NetworkImage(project.imageUrl)),
            FadeInImage.assetNetwork(placeholder: 'assets/images/trail_loading.gif', image: project.imageUrl),

            SizedBox(height: 5),

            if(project.projectUrl != null)

            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: ColorScheme.of(context).secondary,
                side: BorderSide(color: ColorScheme.of(context).onSecondary, width: 2), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                )
              ),
              onPressed: () async {
                final Uri url = Uri.parse(project.projectUrl!);

                if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: Text('GitHub', style: TextStyle(color: ColorScheme.of(context).onSecondary),),
            )
          ],
        ),
      ),
    );
  }
}