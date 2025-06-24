import 'package:flutter/material.dart';


class SettingsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          shape: StadiumBorder(),
          color: Colors.blueAccent,
          onPressed: () {},
          child: Text("Change DarkMode"),
        )
     ),
   );
  }
}