import 'package:flutter/material.dart';

class ImageAndName extends StatelessWidget {
  final String name;
  final String image;

  const ImageAndName({super.key, required this.name, required this.image});

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
            foregroundImage: NetworkImage(image),
            radius: 75,
          ),
          SizedBox(width: 10),
          Expanded(child: Text(name, style: TextStyle(fontSize: 30, overflow: TextOverflow.visible)))
        ],
      ),
    );
  }
}