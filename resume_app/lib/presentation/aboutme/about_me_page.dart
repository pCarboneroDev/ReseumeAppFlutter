import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_app/l10n/app_localizations.dart';
import 'package:resume_app/presentation/Widgets/loading_error.dart';
import 'package:resume_app/presentation/aboutme/bloc/about_me_bloc.dart';
import 'package:resume_app/presentation/aboutme/widgets/about_me_modal.dart';
import 'package:resume_app/presentation/aboutme/widgets/image_and_name.dart';
import 'package:resume_app/presentation/aboutme/widgets/skills_cards.dart';
import 'package:resume_app/presentation/aboutme/widgets/skills_row.dart';
import 'package:resume_app/utils/ui_state.dart';


class AboutMePage extends StatefulWidget {

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> with TickerProviderStateMixin {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    load();
  }

  void load(){
    BlocProvider.of<AboutMeBloc>(context).add(LoadAboutEvent(Localizations.localeOf(context).languageCode));
  }


  @override
  Widget build(BuildContext context) {

    final ScrollController controller = ScrollController();

    void callChangeListEvent(Set<List<String>> selected){
      BlocProvider.of<AboutMeBloc>(context).add(ChangeListEvent(selected.first));
    }
    

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.aboutTitle)
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

        child: BlocBuilder<AboutMeBloc, AboutMeState>(
          builder: (context, state) {
            final status = <UIStatus, Widget>{
              UIStatus.error: Center(child: LoadingError(reload: load)),
              UIStatus.idle: Center(child: Text("IDLE")),
              UIStatus.loading: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator.adaptive(),

                    Padding(
                      padding: EdgeInsetsGeometry.only(top: 15),
                      child: AnimatedSlide(
                        offset: state.showTimerText ? Offset(0, 0) : Offset(0, 0.5),
                        duration: const Duration(milliseconds: 2000),
                        curve: Curves.easeOut,
                        child: AnimatedOpacity(
                          opacity: state.showTimerText ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 2000),
                          child: Text(
                            "It may take a couple of minutes to initialize the server",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ),
              UIStatus.success: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ImageAndName(
                        name: state.about.name,
                        image: state.about.profilePicture,
                      ),

                      MaterialButton(
                        color: ColorScheme.of(context).primaryContainer,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context, 
                            showDragHandle: true,
                            builder: (context) {
                              return AboutMeModal(
                                name: state.about.name,
                                role: state.about.role,
                                presentation: state.about.shortDescription
                              );
                            },
                          );
                        },
                        shape: StadiumBorder(),
                        child: Text(AppLocalizations.of(context)!.modalButton),
                      ),

                      SizedBox(height: 20),

                      SkillsRow(
                        selected: state.selectedList,
                        languages: state.about.languages,
                        frameworks: state.about.frameworks,
                        other: state.about.other,
                        method: callChangeListEvent,
                        controller: controller,
                      ),

                      SizedBox(height: 20),

                      SkillsCards(skills: state.about.skills)
                    ],
                  ),
                ),
              ),
            };
            return status[state.uiState.status] ?? Container();
          },
        )
      )
   );
  }
}