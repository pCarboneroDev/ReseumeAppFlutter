import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:resume_app/presentation/aboutme/about_me_page.dart';
import 'package:resume_app/presentation/settings/settings_page.dart';


class Mainpage extends StatefulWidget {
  const Mainpage({super.key});


  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    final List<Widget> screens = [AboutMePage(), AboutMePage(), AboutMePage(), SettingsPage()];

    return Scaffold(
      bottomNavigationBar: GNav(
        backgroundColor: Theme.of(context).primaryColor,
        gap: 8,
        onTabChange: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        tabs: [
          GButton(icon: FontAwesomeIcons.person, text: 'About me'),
          GButton(icon: FontAwesomeIcons.newspaper, text: 'My experience'),
          GButton(icon: FontAwesomeIcons.book, text: 'My studies'),
          GButton(icon: Icons.settings, text: 'App Settings'),
        ]
      ),
      body: screens[selectedIndex],
   );
  }
}