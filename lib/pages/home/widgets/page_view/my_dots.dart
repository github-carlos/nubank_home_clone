import 'package:flutter/material.dart';

class MyDots extends StatelessWidget {
  final double top;
  final int currentIndex;
  final bool showDots;

  Color getColor(int index) {
    return index == currentIndex ? Colors.white : Colors.white38;
  }

  MyDots({this.top, this.currentIndex, this.showDots});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: showDots ?  1 : 0,
        child: Row(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 7,
              width: 7,
              decoration:
                  BoxDecoration(color: getColor(0), shape: BoxShape.circle),
            ),
            SizedBox(
              width: 8,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 7,
              width: 7,
              decoration:
                  BoxDecoration(color: getColor(1), shape: BoxShape.circle),
            ),
            SizedBox(
              width: 8,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 7,
              width: 7,
              decoration:
                  BoxDecoration(color: getColor(2), shape: BoxShape.circle),
            ),
          ],
        ),
      ),
    );
  }
}
