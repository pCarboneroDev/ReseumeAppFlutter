import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_app/presentation/settings/bloc/settings_bloc.dart';
import 'package:resume_app/utils/ui_state.dart';


class SettingsPage extends StatefulWidget {

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //final settingsBloc = BlocProvider.of<SettingsBloc>(context);
    //settingsBloc.add(OnLoadSettingsEvent());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          final statusW = <UIStatus, Widget>{
            UIStatus.error: Center(child: Text("Error")),
            UIStatus.loading: Center(child: CircularProgressIndicator.adaptive()),

            UIStatus.success: Center(
              child: MaterialButton(
                shape: StadiumBorder(),
                color: ColorScheme.of(context).primaryContainer,
                onPressed: () {
                  final settingsBloc = BlocProvider.of<SettingsBloc>(context);
                  settingsBloc.add(ToggleThemeEvent());
                },
                child: Text("Change DarkMode"),
              )
            )
          };

          return statusW[state.state.status] ?? Container(); 
        },
      )
   );
  }
}