import 'package:flutter/material.dart';

class ImageAndName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            foregroundImage: NetworkImage('https://pcarbonerodev.github.io/Carbonero-WebPortfolio/assets/images/profile.png'),
            radius: 75,
          ),
          SizedBox(width: 10),
          Expanded(child: Text("Pablo Carbonero Almellones", style: TextStyle(fontSize: 30, overflow: TextOverflow.visible)))
        ],
      ),
    );
  }
}