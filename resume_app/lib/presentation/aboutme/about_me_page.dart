import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:resume_app/domain/entities/skill_detail_model.dart';
import 'package:resume_app/l10n/app_localizations.dart';
import 'package:resume_app/presentation/aboutme/widgets/about_me_modal.dart';
import 'package:resume_app/presentation/aboutme/widgets/image_and_name.dart';


class AboutMePage extends StatefulWidget {

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> with TickerProviderStateMixin {
  final String presentation = '''
    I am a Software Developer specialised in Android and cross-platform app development, with expertise in Flutter, Jetpack Compose, and .NET frameworks. Experienced with both front-end and back-end sides of an application. Additionally, I have extensive knowledge of a wide range of programming languages and technologies, enabling me to work in nearly all areas of software development.
    ''';

  final List<String> languages = ["Kotlin, Dart, C#, Java, JavaScript, TypeScript, Python"];
  final List<String> frameworks = [".NET, Flutter, Jetpack Compose, Angular"];
  final List<String> skills = ["MVVM, MVC, Clean Architecture, Hexagonal Architecture, Railway Oriented Programming"];

  final List<SkillDatailModel> pIL = [
    SkillDatailModel(
      name: "Design patterns", 
      description: "Aliqua sunt culpa ut exercitation ad enim dolore commodo aliquip reprehenderit."
    ),
    SkillDatailModel(
      name: ".NET", 
      description: "Reprehenderit ullamco magna nisi duis dolore quis esse officia amet ut ut."
    ),
    SkillDatailModel(
      name: "Mobile apps", 
      description: "Minim mollit fugiat tempor ullamco laborum qui nostrud."
    ),
    SkillDatailModel(
      name: "GIT", 
      description: "Adipisicing aliquip occaecat dolor minim mollit."
    ),
  ];

  @override
  Widget build(BuildContext context) {

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


                MaterialButton(
                  color: ColorScheme.of(context).primaryContainer,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context, 
                      showDragHandle: true,
                      builder: (context) {
                        return AboutMeModal(presentation: presentation);
                      },
                    );
                  },
                  shape: StadiumBorder(),
                  child: Text("Read something about me!"),
                ),

                SizedBox(height: 20),

                _SkillsRow(
                  languages: languages,
                  frameworks: frameworks,
                  skills: skills,
                ),

                SizedBox(height: 20),

                ExpansionTile(
                  title: Text("Know more about my skills", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text("Tap to see details about my skills"),
                  children: [
                    StaggeredGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      children: List.generate(
                        pIL.length, 
                        (index) {
                          return Container(
                            margin: EdgeInsets.all(5),
                            width: double.infinity,
                            child: Card(
                              color: ColorScheme.of(context).onSurface,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: ColorScheme.of(context).secondary,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        topRight: Radius.circular(16)
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorScheme.of(context).secondary.withValues(alpha: 0.5),
                                          blurRadius: 4,
                                          offset: Offset(0, 5),
                                        )
                                      ]
                                    ),
                                    child: Text(
                                      pIL[index].name, 
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: ColorScheme.of(context).onSecondary, 
                                        fontSize: 25,
                                        shadows: [
                                          Shadow(
                                            color: ColorScheme.of(context).onSurface.withValues(alpha: 1),
                                            blurRadius: 15,
                                            offset: Offset(0, 1),
                                          )
                                        ]
                                      )
                                    )
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(pIL[index].description, textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 15)),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )
   );
  }
}

class _SkillsRow extends StatelessWidget {
  final List<String> languages;
  final List<String> frameworks;
  final List<String> skills;

  const _SkillsRow({required this.languages, required this.frameworks, required this.skills}); 
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: ColorScheme.of(context).onSurface),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SegmentedButton(
            segments: [
              ButtonSegment(
                value: languages,
                label: Text("Languages")
              ),
              ButtonSegment(
                value: frameworks,
                label: Text("Frameworks")
              ),
              ButtonSegment(
                value: skills,
                label: Text("Skills")
              )
            ], 
            selected: <List<String>>{languages},
            onSelectionChanged: (newS) {
              
            },
          ),

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
                        offset: Offset(0, 1),
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
        ],
      ),
    );
  }
}



                /*GestureFlipCard(
                  frontWidget: FrontInfoCard(
                    title: "Get to know me",
                    icon: FontAwesomeIcons.gamepad,
                  ), 
                  backWidget: BackInfoCard(
                    firstLine: "⚔🐲👾",
                    secondLine: "My favourite videogames are Pokemon and TES saga.",
                    thirdLine: "Sit sit consequat reprehenderit eu dolor nostrud officia sunt eiusmod.",
                  ), 
                  controller: controller
                ),

                SizedBox(height: 10),

                GestureFlipCard(
                  frontWidget: FrontInfoCard(
                    title: "Music taste",
                    icon: FontAwesomeIcons.guitar,
                  ), 
                  backWidget: BackInfoCard(
                    firstLine: "🎸🎤🤘",
                    secondLine: "Self-taught guitarist and gutural singer. I even played in a band that got to play live once before disbanding",
                    thirdLine: "“El código tiene ritmo, igual que una buena canción.”",
                  ), 
                  controller: controller
                )*/