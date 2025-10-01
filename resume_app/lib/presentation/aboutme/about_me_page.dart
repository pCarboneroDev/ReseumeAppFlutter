import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume_app/l10n/app_localizations.dart';
import 'package:resume_app/presentation/experience/ui/widgets/front_info_card.dart';
import 'package:resume_app/presentation/experience/ui/widgets/back_info_card.dart';
import 'package:resume_app/presentation/experience/ui/widgets/image_and_name.dart';


class AboutMePage extends StatefulWidget {

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final controller = GestureFlipCardController();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.aboutTitle),
        backgroundColor: ColorScheme.of(context).secondary,
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
                ),
                
                Text(
                  "Cupidatat ad aliquip non occaecat et magna ea cillum mollit anim sunt quis proident. Ullamco ut duis duis ex fugiat commodo culpa sit ea sunt minim. Enim do dolor fugiat deserunt veniam commodo pariatur ipsum ipsum ad aliqua consectetur quis. Consequat incididunt culpa minim Lorem veniam adipisicing duis enim eu.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ),
      )
   );
  }
}


