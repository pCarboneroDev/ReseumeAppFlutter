import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_app/l10n/app_localizations.dart';
import 'package:resume_app/presentation/experience/bloc/experience_bloc.dart';
import 'package:resume_app/presentation/experience/ui/widgets/experience_card.dart';
import 'package:resume_app/utils/ui_state.dart';


class ExperiencePage extends StatefulWidget {

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> with TickerProviderStateMixin {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<ExperienceBloc>(context).add(GetAllExperienceEvent(Localizations.localeOf(context).languageCode));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.experienceTitle),
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

        child: BlocBuilder<ExperienceBloc, ExperienceState>(
          builder: (context, state) {
            final status = <UIStatus, Widget>{
              UIStatus.error: Center(child: Text("ERROR")),
              UIStatus.idle: Center(child: Text("IDLE")),
              UIStatus.loading: Center(child: CircularProgressIndicator.adaptive()),
              UIStatus.success: ListView.builder(
                itemCount: state.experienceList.length,
        
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ExperienceCard(exp: state.experienceList[index]),
                  );
                },
              )
            };
            return status[state.uiState.status] ?? Container();
          }
        ),
      )
   );
  }
}


