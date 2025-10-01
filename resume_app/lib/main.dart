import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:resume_app/di/dependency_injection.dart';
import 'package:resume_app/domain/entities/theme_entity.dart';
import 'package:resume_app/l10n/app_localizations.dart';
import 'package:resume_app/presentation/apptheme/app_theme.dart';
import 'package:resume_app/presentation/experience/bloc/experience_bloc.dart';
import 'package:resume_app/presentation/mainpage/ui/mainpage.dart';
import 'package:resume_app/presentation/projects/bloc/projects_bloc.dart';
import 'package:resume_app/presentation/settings/bloc/settings_bloc.dart';
import 'package:resume_app/presentation/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initGetIt();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<SettingsBloc>()/*..add(GetThemeEvent())*/,
        ),
        BlocProvider(
          create: (context) => getIt<ProjectsBloc>(),
        ),
        BlocProvider(create: (context) => getIt<ExperienceBloc>(),)
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return FutureBuilder(
          future: AppTheme.getTheme(state.themeEntity.theme == ThemeType.dark),
          builder: (BuildContext context, AsyncSnapshot snapshot) {

            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'ResumeApp',
              theme: snapshot.data,
              locale: state.locale,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
                Locale('en'),
                Locale('es')
              ],
              routes: {
                "home": (context) => Mainpage(),
                "splash": (context) => SplashScreenPage()
              },
              initialRoute: "splash",
            );
          },
        );
      },
    );
  }
}