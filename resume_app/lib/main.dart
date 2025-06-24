import 'package:flutter/material.dart';
import 'package:resume_app/data/sharedpreferences/preferences.dart';
import 'package:resume_app/di/dependency_injection.dart';
import 'package:resume_app/presentation/apptheme/app_theme.dart';
import 'package:resume_app/presentation/mainpage/ui/mainpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  await initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ResumeApp',
      theme: Preferences.isDarkmode ? AppTheme.darkTheme : AppTheme.lightTheme,
      routes: {
        "home": (context) => Mainpage()
      },
      initialRoute: "home",
    );
  }
}