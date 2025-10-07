import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_app/domain/entities/experience_model.dart';
import 'package:resume_app/l10n/app_localizations.dart';
import 'package:resume_app/presentation/experience/bloc/experience_bloc.dart';
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


  final List<ExperienceModel> expList = [
    ExperienceModel(
      companyName: 'M&L Apps SL', 
      role: 'Fullstack Flutter developer', 
      date: 'March 2025 - June 2025', 
      location: "Seville, Spain", 
      description: [
        'Developed both front-end and back-end of a cross-platform mobile app for iOS and Android using Flutter.',
        'Structured app using MVVM architecture and Bloc for state management.',
        'Implemented a clean and scalable architecture combining Clean Architecture principles with elements of Hexagonal Architecture.',
        'Utilized the Dartz package to apply Railway Oriented Programming with the Either Left, Right pattern.',
        'Integrated REST APIs using the Dio package.',
        'Connected the app to Firebase services, including Firestore'
      ],
      companyLogo: 'https://www.creaodontologia.com/wp-content/uploads/2025/03/placeholder-2.png'
    ),

    ExperienceModel(
      companyName: 'Timber Films', 
      role: 'Videogame Developer', 
      date: 'March 2023 - June 2023', 
      location: "Seville, Spain", 
      description: [
        'Developer of the videogame “Mencía. A Never Was Tale”. Available on Steam.',
        'Developed core gameplay features and implemented the entire main menu logic.',
        'Implemented enemy and boss mechanics and handled bug fixing throughout development.',
        'Code optimization and testing to ensure smooth gameplay.',
        'Scrum methodology for the whole development.',
        'You can see my name in the final credits!'
      ],
      companyLogo: 'https://format.creatorcdn.com/3a7bbb45-9300-4897-9864-438c929169b6/0/0/0/0,0,1007,1345,960,1345/0-0-0/962b77c4-4db2-49c2-a961-eb8e72362e58/1/1/Screen+Shot+2019-08-01+at+11.46.28+AM.png?fjkss=exp=2069948449~hmac=ba2da7512c90b37ae43598c36a34ae78db63875d20e037bf3fd234b1e0fd6c64'
    )
  ];

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
                    child: _ExperienceCard(exp: state.experienceList[index]),
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

class _ExperienceCard extends StatelessWidget {
  final ExperienceModel exp;
  
  const _ExperienceCard({
    required this.exp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorScheme.of(context).onSurface)
      ),

      child: ExpansionTile(
        backgroundColor: ColorScheme.of(context).primaryFixed,
        childrenPadding: EdgeInsets.all(8),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: NetworkImage(exp.companyLogo), width: 100),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(exp.role, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ColorScheme.of(context).onPrimaryContainer), overflow: TextOverflow.fade),
                      Text(exp.companyName, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                      Text(exp.date),
                      Text(exp.location)
                    ],
                  ),
                )
              ],
            ),
        children: [
          ...exp.description.map((s) => Text("• $s", style: TextStyle(fontSize: 15)))
        ],
      ),
    );
  }
}


/* 
Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,

      decoration: BoxDecoration(
        color: ColorScheme.of(context).primaryFixed,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: ColorScheme.of(context).onPrimary,
          width: 2
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: NetworkImage(exp.companyLogo), width: 100),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(exp.role, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ColorScheme.of(context).onPrimaryContainer)),
                  Text(exp.companyName, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  Text(exp.date),
                  Text(exp.location)
                ],
              )
            ],
          ),
          SizedBox(height: 20),
          ...exp.description.map((s) => Text("• $s", style: TextStyle(fontSize: 15)))
        ],
      ),
    ); 
  */