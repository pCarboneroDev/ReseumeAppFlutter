import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_app/di/dependency_injection.dart';
import 'package:resume_app/domain/entities/theme_entity.dart';
import 'package:resume_app/presentation/apptheme/app_theme.dart';
import 'package:resume_app/presentation/mainpage/ui/mainpage.dart';
import 'package:resume_app/presentation/settings/bloc/settings_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initGetIt();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<SettingsBloc>()..add(GetThemeEvent()),
        ),
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
              // Mostrar pantalla de carga mientras se resuelve el tema
              return const Center(child: CircularProgressIndicator());
            }

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'ResumeApp',
              theme: snapshot.data,
              routes: {
                "home": (context) => Mainpage()
              },
              initialRoute: "home",
            );
          },
        );
      },
    );
  }
}