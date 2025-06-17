import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        backgroundColor: Theme.of(context).primaryColor,
        gap: 8,
        tabs: [
          GButton(icon: Icons.home, text: 'Resume'),
          GButton(icon: FontAwesomeIcons.person, text: 'About me'),
          GButton(icon: FontAwesomeIcons.newspaper, text: 'My experience'),
          GButton(icon: FontAwesomeIcons.book, text: 'My studies'),
        ]
      ),
      body: Center(
        child: MaterialButton(onPressed: (){
          
        }),
     ),
   );
  }
}