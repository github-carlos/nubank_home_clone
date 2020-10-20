import 'package:flutter/material.dart';
import 'file:///D:/AndroidStudioProjects/nubank_interface_clone/lib/pages/home/widgets/cards/first_card.dart';
import 'file:///D:/AndroidStudioProjects/nubank_interface_clone/lib/pages/home/widgets/cards/second_card.dart';
import 'file:///D:/AndroidStudioProjects/nubank_interface_clone/lib/pages/home/widgets/cards/third_card.dart';

import '../cards/card_app.dart';

class PageViewApp extends StatefulWidget {
  final double top;
  final ValueChanged<int> onChanged;
  final GestureDragUpdateCallback onPanUpdate;

  PageViewApp({this.top, this.onChanged, this.onPanUpdate});

  @override
  _PageViewAppState createState() => _PageViewAppState();
}

class _PageViewAppState extends State<PageViewApp> {
  Tween<double> _tween;

  @override
  void initState() {
    super.initState();
    _tween = Tween<double>(begin: 80, end: 80);
   delayAnimation();
  }

  Future<void> delayAnimation() async{
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _tween = Tween<double>(begin:80, end: 0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: _tween,
      duration: Duration(milliseconds: 400),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return AnimatedPositioned(
          duration: Duration(milliseconds: 150),
          curve: Curves.easeOut,
          top: widget.top,
          height: MediaQuery.of(context).size.height * .45,
          left: value,
          right: value * -1,
          child: GestureDetector(
            onPanUpdate: widget.onPanUpdate,
            child: PageView(
              onPageChanged: widget.onChanged,
              physics: BouncingScrollPhysics(),
              children: [
                CardApp(child: FirstCard(),),
                CardApp(child: SecondCard()),
                CardApp(child: ThirdCard(),),
              ],
            ),
          ),
        );
      }
    );
  }
}
