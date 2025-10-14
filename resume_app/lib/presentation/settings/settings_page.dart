import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume_app/domain/entities/theme_entity.dart';
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
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Text("${AppLocalizations.of(context)!.appTheme}: ${(state.themeEntity.theme == ThemeType.dark ? AppLocalizations.of(context)!.dark : AppLocalizations.of(context)!.light)}", style: TextStyle(fontSize: 18)),
                        Spacer(),
                        MaterialButton(
                          shape: StadiumBorder(),
                          //height: 50,
                          color: ColorScheme.of(context).primaryContainer,
                          onPressed: () {              
                            settingsBloc.add(ToggleThemeEvent());
                          },
                          child: Icon((state.themeEntity.theme == ThemeType.dark) ? FontAwesomeIcons.sun : FontAwesomeIcons.moon),
                        ),
                      ],
                    ),
                  ),

                  Divider(),

                  // lang dropdown
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Text("${AppLocalizations.of(context)!.appLanguage}:", style: TextStyle(fontSize: 18)),
                        Spacer(),
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
                        ),
                      ],
                    ),
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