import 'package:flutter/material.dart';

class AboutMeModal extends StatelessWidget {

  final String name;
  final String role;
  final String presentation;

  const AboutMeModal({super.key, required this.name, required this.role, required this.presentation});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello, I am", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: ColorScheme.of(context).primary)),
            Text(name, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Text(role, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: ColorScheme.of(context).primary)),
            SizedBox(height: 20),
            Text(presentation, style: TextStyle(fontSize: 20))
          ],
        ),
      ),
    );
  }
}
