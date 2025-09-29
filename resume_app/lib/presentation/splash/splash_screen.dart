import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_app/presentation/settings/bloc/settings_bloc.dart';
import 'package:resume_app/utils/ui_state.dart';

class SplashScreenPage extends StatefulWidget {

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    BlocProvider.of<SettingsBloc>(context).add(LoadSettingdEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SettingsBloc, SettingsState>(
        listener: (context, state) {
          if (state.uiState.status == UIStatus.success) {
              Navigator.pushReplacementNamed(context, 'home');
            }
        },
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            final statusW = <UIStatus, Widget>{
              UIStatus.idle: Center(child: Text("IDLE")),
              UIStatus.error: Center(child: Text("CRITICAL ERROR. APP CAN'T RUN")),
              UIStatus.loading: Center(child: CircularProgressIndicator.adaptive())
            };
            return statusW[state.uiState.status] ?? Container();
          },
        ),
      )
   );
  }
}