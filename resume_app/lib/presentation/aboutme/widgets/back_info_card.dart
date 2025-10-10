import 'package:flutter/material.dart';

class BackInfoCard extends StatelessWidget {

  final String firstLine;
  final String secondLine;
  final String thirdLine;

  const BackInfoCard({super.key, required this.firstLine, required this.secondLine, required this.thirdLine});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: ColorScheme.of(context).primaryContainer,
        borderRadius: BorderRadius.circular(15),
        border: BoxBorder.all(color: ColorScheme.of(context).onSurface, width: 2)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Text(firstLine, style: const TextStyle(fontSize: 25)),
          const Divider(color: Colors.white38, thickness: 1, indent: 40, endIndent: 40),
          const SizedBox(height: 10),

          Text(secondLine, 
            style: TextStyle(fontSize: 25), 
            textAlign: TextAlign.center
          ),

          const SizedBox(height: 10),
          const Divider(color: Colors.white38, thickness: 1, indent: 40, endIndent: 40),
          const SizedBox(height: 10),
          Text( thirdLine, 
            textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 14,
            ),
          ),
        ],
      )
    );
  }
}