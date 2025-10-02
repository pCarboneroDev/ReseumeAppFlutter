import 'package:flutter/material.dart';

class BackInfoCard extends StatelessWidget {
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
      child: Text("Back")
    );
  }
}