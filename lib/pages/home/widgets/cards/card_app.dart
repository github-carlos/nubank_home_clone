import 'package:flutter/material.dart';

class CardApp extends StatelessWidget {
  final Widget child;

  CardApp({this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white
        ),
        child: child,
      ),
    );
  }
}
