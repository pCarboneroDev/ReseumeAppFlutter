import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_app/l10n/app_localizations.dart';
import 'package:resume_app/presentation/projects/bloc/projects_bloc.dart';
import 'package:resume_app/presentation/projects/ui/widgets/project_card.dart';
import 'package:resume_app/utils/ui_state.dart';


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
                  return ProjectCard(project: state.projectList[index]);
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

