import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_app/l10n/app_localizations.dart';
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
    final settingsBloc = BlocProvider.of<SettingsBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingsTitle),
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          final statusW = <UIStatus, Widget>{
            UIStatus.error: Center(child: Text("Error")),
            UIStatus.loading: Center(child: CircularProgressIndicator.adaptive()),

            UIStatus.success: Center(
              child: Column(
                children: [
                  // theme button
                  MaterialButton(
                    shape: StadiumBorder(),
                    color: ColorScheme.of(context).primaryContainer,
                    onPressed: () {              
                      settingsBloc.add(ToggleThemeEvent());
                    },
                    child: Text("Change DarkMode"),
                  ),

                  // lang dropdown
                  DropdownButton(
                    value: state.locale,
                    items: [
                      DropdownMenuItem(value: Locale('en'), child: Text('English')),
                      DropdownMenuItem(value: Locale('es'), child: Text('Español'))
                    ], 
                    onChanged: (value) {
                      if (value != null){
                        settingsBloc.add(ChangeLocaleEvent(value));
                      }
                    },
                  )
                ],
              )
            )
          };

          return statusW[state.uiState.status] ?? Container(); 
        },
      )
   );
  }
}