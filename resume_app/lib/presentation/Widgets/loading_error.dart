import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:resume_app/l10n/app_localizations.dart';

class LoadingError extends StatelessWidget {

  final Function reload;

  const LoadingError({super.key, required this.reload});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          //Image(image: AssetImage('assets/images/searching.gif'))
          Text(AppLocalizations.of(context)!.errorTitle, 
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45)),
          LottieBuilder.asset('assets/lotties/searching.json'),
          Text(AppLocalizations.of(context)!.errorText,
          textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20
          )),

          SizedBox(height: 15),

          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: ColorScheme.of(context).secondary
            ),
            iconSize: 55,
            color: ColorScheme.of(context).onSecondary,
            onPressed: (){ 
              reload();
            }, 
            icon: Icon(Icons.replay_outlined)
          ),


        ],
      ),
    );
  }
}