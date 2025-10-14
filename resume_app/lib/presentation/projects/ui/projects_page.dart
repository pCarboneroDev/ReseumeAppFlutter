import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_app/domain/entities/project_model.dart';
import 'package:resume_app/l10n/app_localizations.dart';
import 'package:resume_app/presentation/projects/bloc/projects_bloc.dart';
import 'package:resume_app/utils/ui_state.dart';
import 'package:url_launcher/url_launcher.dart';


class ProjectsPage extends StatefulWidget {

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> with TickerProviderStateMixin {

  @override
  void initState() {
    
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<ProjectsBloc>(context).add(OnLoadProjects(Localizations.localeOf(context).languageCode));
  }

  final List<ProjectModel> projectList = [
    ProjectModel(
      name: "Android Guitar Tuner", 
      description: "Consequat incididunt pariatur enim ut Lorem eu ullamco amet enim cupidatat pariatur veniam. Laborum nostrud dolor dolore labore commodo. Aute veniam ex est voluptate labore cillum pariatur duis. Dolore non dolore cillum reprehenderit aute excepteur eiusmod amet irure elit. Dolore quis duis commodo tempor anim occaecat tempor sit dolore velit esse.", 
      imageUrl: 'https://pcarbonerodev.github.io/Carbonero-WebPortfolio/assets/images/androidTunerPreview.png', 
      projectUrl: 'https://github.com/pCarboneroDev/ProyectoFinalDam'
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
        title: Text(AppLocalizations.of(context)!.projectsTitle), //AppLocalizations.of(context)!.projectsTitle
      ),
      body: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(
          options: ParticleOptions(
            spawnMinSpeed: 5,
            spawnMaxSpeed: 20,
            spawnMaxRadius: 50,
            spawnMinRadius: 10,
            baseColor: ColorScheme.of(context).primary,
            particleCount: 20
          )
        ),
        child: BlocBuilder<ProjectsBloc, ProjectsState>(
          builder: (context, state) {
            final statusW = <UIStatus, Widget>{
              UIStatus.error: Center(child: Text("ERROR")),
              UIStatus.loading: Center(child: CircularProgressIndicator.adaptive()),
              UIStatus.success: ListView.builder(
                itemCount: state.projectList.length,
                itemBuilder: (context, index) {
                  return _ProjectCard(project: state.projectList[index]);
                },
              )
            };
            return statusW[state.uiState.status] ?? Container();
          },
        ),
      )
    );
  }
}

class _ProjectCard extends StatelessWidget {

  final ProjectModel project;


  const _ProjectCard({
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
          color: ColorScheme.of(context).onPrimary,
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
            Image(image: NetworkImage(project.imageUrl)),

            SizedBox(height: 5),

            if(project.projectUrl != null)
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: ColorScheme.of(context).secondary,
                side: BorderSide(color: ColorScheme.of(context).onSecondary, width: 2), // borde
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