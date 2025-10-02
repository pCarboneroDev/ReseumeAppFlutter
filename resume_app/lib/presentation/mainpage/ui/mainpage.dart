import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume_app/l10n/app_localizations.dart';
import 'package:resume_app/presentation/aboutme/about_me_page.dart';
import 'package:resume_app/presentation/contact/ui/contact_page.dart';
import 'package:resume_app/presentation/experience/ui/experience_page.dart';
import 'package:resume_app/presentation/projects/ui/projects_page.dart';
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

    final List<Widget> screens = [AboutMePage(), ExperiencePage(), ProjectsPage(), ContactPage(), SettingsPage()];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(

        selectedItemColor: ColorScheme.of(context).onSurface,
        unselectedItemColor: ColorScheme.of(context).primary,

        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        currentIndex: selectedIndex,
        items: [
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.person), label: AppLocalizations.of(context)!.aboutTitle),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.newspaper), label: AppLocalizations.of(context)!.experienceTitle),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.book), label: AppLocalizations.of(context)!.projectsTitle),
          BottomNavigationBarItem(icon: Icon(Icons.email), label: AppLocalizations.of(context)!.contactTitle),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: AppLocalizations.of(context)!.settingsTitle),
        ]
      ),
      body: Center(child: screens[selectedIndex]),
   );
  }
}

/**
 * 
 * 
 * 
 * 
 * GNav(
        backgroundColor: Theme.of(context).primaryColor,
        gap: 8,
        onTabChange: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        tabs: [
          GButton(icon: FontAwesomeIcons.person, text: 'About me'),
          GButton(icon: FontAwesomeIcons.newspaper, text: 'Experience'),
          GButton(icon: FontAwesomeIcons.book, text: 'Projects'),
          GButton(icon: FontAwesomeIcons.mailchimp, text: 'Contact'),
          GButton(icon: Icons.settings, text: 'App Settings'),
        ]
      )
 */