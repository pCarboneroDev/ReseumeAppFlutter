import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume_app/l10n/app_localizations.dart';
import 'package:resume_app/presentation/aboutme/widgets/front_info_card.dart';
import 'package:resume_app/presentation/aboutme/widgets/back_info_card.dart';
import 'package:resume_app/presentation/aboutme/widgets/image_and_name.dart';


class AboutMePage extends StatefulWidget {

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> with TickerProviderStateMixin {
  final String presentation = '''
I am a Software Developer specialised in Android and cross-platform app development, with expertise in Flutter, Jetpack Compose, and .NET frameworks. Experienced with both front-end and back-end sides of an application. Additionally, I have extensive knowledge of a wide range of programming languages and technologies, enabling me to work in nearly all areas of software development.
''';
  @override
  Widget build(BuildContext context) {
    final controller = GestureFlipCardController();

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

        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageAndName(),

                SizedBox(
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: 0.5),
                              spreadRadius: 3,
                              blurRadius: 4,
                              offset: Offset(0, 1), // changes position of shadow
                            )
                          ],
                          color: ColorScheme.of(context).primaryContainer,
                          borderRadius: BorderRadius.circular(7),
                          border: BoxBorder.all(color: ColorScheme.of(context).onSurface, width: 2)
                        ),
                        child: Center(child: Text("Kotlin", style: TextStyle(fontSize: 25))),
                      );
                    },
                  ),
                ),

                SizedBox(height: 20),

                MaterialButton(
                  color: ColorScheme.of(context).primaryContainer,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context, 
                      showDragHandle: true,
                      builder: (context) {
                        return _AboutMeModal(presentation: presentation);
                      },
                    );
                  },
                  shape: StadiumBorder(),
                  child: Text("Read something about me!"),
                ),

                SizedBox(height: 20),

                GestureFlipCard(
                  frontWidget: FrontInfoCard(
                    title: "Get to know me",
                    icon: FontAwesomeIcons.person,
                  ), 
                  backWidget: BackInfoCard(), 
                  controller: controller
                ),

                SizedBox(height: 10),

                GestureFlipCard(
                  frontWidget: FrontInfoCard(
                    title: "My hobbies",
                    icon: FontAwesomeIcons.person,
                  ), 
                  backWidget: BackInfoCard(), 
                  controller: controller
                )
              ],
            ),
          ),
        ),
      )
   );
  }
}

class _AboutMeModal extends StatelessWidget {
  const _AboutMeModal({
    required this.presentation,
  });

  final String presentation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello, I am", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: ColorScheme.of(context).primary)),
            Text("Pablo Carbonero Almellones", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Text("Software developer", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: ColorScheme.of(context).primary)),
            SizedBox(height: 20),
            Text(presentation, style: TextStyle(fontSize: 20))
          ],
        ),
      ),
    );
  }
}


