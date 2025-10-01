import 'package:flutter/material.dart';

class FrontInfoCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const FrontInfoCard({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: ColorScheme.of(context).primaryContainer,
        borderRadius: BorderRadius.circular(15),
        border: BoxBorder.all(color: ColorScheme.of(context).onSurface, width: 2)
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),

            /*Icon(
              icon,
              size: 200,
            ),*/
            
            
            Row(
              children: [
                Spacer(),
                Image(
                  width: 50,
                  image: AssetImage("assets/images/slide.gif")
                )
              ],
            )

          ],
        ),
      )
    );
  }
}