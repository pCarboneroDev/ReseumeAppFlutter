import 'package:flutter/material.dart';


class AboutMePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About me"),
        backgroundColor: ColorScheme.of(context).secondary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    foregroundImage: NetworkImage('https://pcarbonerodev.github.io/Carbonero-WebPortfolio/assets/images/profile.png'),
                    radius: 75,
                  ),
                  //Spacer(),
                  Expanded(child: Text("Pablo Carbonero Almellones", style: TextStyle(fontSize: 30, overflow: TextOverflow.visible)))
                ],
              ),
            ),
            
            Text(
              "Cupidatat ad aliquip non occaecat et magna ea cillum mollit anim sunt quis proident. Ullamco ut duis duis ex fugiat commodo culpa sit ea sunt minim. Enim do dolor fugiat deserunt veniam commodo pariatur ipsum ipsum ad aliqua consectetur quis. Consequat incididunt culpa minim Lorem veniam adipisicing duis enim eu.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      )
   );
  }
}