import 'package:flutter/material.dart';

class AboutMeModal extends StatelessWidget {
  const AboutMeModal({
    required this.presentation,
  });

  final String presentation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello, I am", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: ColorScheme.of(context).primary)),
            Text("Pablo Carbonero Almellones", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Text("Software developer", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: ColorScheme.of(context).primary)),
            SizedBox(height: 20),
            Text(presentation, style: TextStyle(fontSize: 20))
          ],
        ),
      ),
    );
  }
}
