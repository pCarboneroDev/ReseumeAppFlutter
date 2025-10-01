import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:resume_app/l10n/app_localizations.dart';


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
                _ImageAndName(),
          
                GestureFlipCard(
                  frontWidget: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.amber
                    ),
                    child: Text("Front")
                  ), 
                  backWidget: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent
                    ),
                    child: Text("Back")
                  ), 
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

class _ImageAndName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            foregroundImage: NetworkImage('https://pcarbonerodev.github.io/Carbonero-WebPortfolio/assets/images/profile.png'),
            radius: 75,
          ),
          SizedBox(width: 10),
          Expanded(child: Text("Pablo Carbonero Almellones", style: TextStyle(fontSize: 30, overflow: TextOverflow.visible)))
        ],
      ),
    );
  }
}