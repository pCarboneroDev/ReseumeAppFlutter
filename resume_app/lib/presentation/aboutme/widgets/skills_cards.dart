import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:resume_app/domain/entities/skill_model.dart';
import 'package:resume_app/l10n/app_localizations.dart';

class SkillsCards extends StatelessWidget {
  const SkillsCards({
    super.key,
    required this.skills,
  });

  final List<SkillModel> skills;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(AppLocalizations.of(context)!.skillsTitle, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      subtitle: Text(AppLocalizations.of(context)!.skillsSubtitle),
      children: [
        StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: List.generate(
            skills.length, 
            (index) {
              return Container(
                margin: EdgeInsets.all(5),
                width: double.infinity,
                child: Card(
                  color: ColorScheme.of(context).onPrimary,
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
                          skills[index].name, 
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
                        child: Text(skills[index].description, textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 15)),
                      )
                    ],
                  ),
                ),
              );
            },
          )
        )
      ],
    );
  }
}