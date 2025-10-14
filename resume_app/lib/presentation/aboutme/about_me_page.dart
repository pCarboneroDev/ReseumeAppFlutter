import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_app/l10n/app_localizations.dart';
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
    BlocProvider.of<AboutMeBloc>(context).add(LoadAboutEvent(Localizations.localeOf(context).languageCode));
  }
  
  final String presentation = '''
    I am a Software Developer specialised in Android and cross-platform app development, with expertise in Flutter, Jetpack Compose, and .NET frameworks. Experienced with both front-end and back-end sides of an application. Additionally, I have extensive knowledge of a wide range of programming languages and technologies, enabling me to work in nearly all areas of software development.
    ''';

  final List<String> languages = ["Kotlin, Dart, C#, Java, JavaScript, TypeScript, Python"];
  final List<String> frameworks = [".NET, Flutter, Jetpack Compose, Angular"];
  final List<String> skills = ["MVVM, MVC, Clean Architecture, Hexagonal Architecture, Railway Oriented Programming"];


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
              UIStatus.error: Center(child: Text("ERROR")),
              UIStatus.idle: Center(child: Text("IDLE")),
              UIStatus.loading: Center(child: CircularProgressIndicator.adaptive()),
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