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
            /*foregroundImage: FadeInImage(
              placeholder: AssetImage('assets/images/trail_loading.gif'), 
              image: NetworkImage(image)
            ), //The argument type 'FadeInImage' can't be assigned to the parameter type 'ImageProvider<Object>?'. */
            radius: 75,
            child: ClipOval(
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/trail_loading.gif',
                image: image,
                fit: BoxFit.cover,
                width: 150,
                height: 150,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(child: Text(name, style: TextStyle(fontSize: 30, overflow: TextOverflow.visible)))
        ],
      ),
    );
  }
}