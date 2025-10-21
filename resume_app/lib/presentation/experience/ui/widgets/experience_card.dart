import 'package:flutter/material.dart';
import 'package:resume_app/domain/entities/experience_model.dart';

class ExperienceCard extends StatelessWidget {
  final ExperienceModel exp;
  
  const ExperienceCard({
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
                FadeInImage.assetNetwork(
                  placeholder: 'assets/images/trail_loading.gif', 
                  image: exp.companyLogo,
                  width: 100,
                ),
                //Image(image: NetworkImage(exp.companyLogo), width: 100),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(exp.role, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ColorScheme.of(context).onSurface), overflow: TextOverflow.fade),
                      Text(exp.companyName, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: ColorScheme.of(context).primary)),
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