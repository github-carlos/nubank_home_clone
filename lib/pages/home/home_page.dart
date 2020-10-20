import 'package:flutter/material.dart';
import 'file:///D:/AndroidStudioProjects/nubank_interface_clone/lib/pages/home/widgets/bottom_menu/bottom_menu.dart';
import 'package:nubank_interface_clone/pages/home/widgets/custom_app_bar.dart';
import 'file:///D:/AndroidStudioProjects/nubank_interface_clone/lib/pages/home/widgets/bottom_menu/item_menu_bottom.dart';
import 'file:///D:/AndroidStudioProjects/nubank_interface_clone/lib/pages/home/widgets/menu/menu_app.dart';
import 'file:///D:/AndroidStudioProjects/nubank_interface_clone/lib/pages/home/widgets/page_view/my_dots.dart';
import 'file:///D:/AndroidStudioProjects/nubank_interface_clone/lib/pages/home/widgets/page_view/page_view_app.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showMenu;
  int _currentIndex;
  double _yPosition;
  @override
  void initState() {
    _showMenu = false;
    _currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    if (_yPosition == null) {
      _yPosition = _screenHeight * .24;
    }
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomAppBar(
            showMenu: _showMenu,
            onTap: () {
              setState(() {
                _showMenu = !_showMenu;
                _yPosition =
                    _showMenu ? _screenHeight * .75 : _screenHeight * .24;
              });
            },
          ),
          MenuApp(
            showMenu: _showMenu,
            top: _screenHeight * .20,
          ),
          BottomMenu(
            showMenu: _showMenu,
          ),
          MyDots(
            showDots: !_showMenu,
            top: _screenHeight * .70,
            currentIndex: _currentIndex,
          ),
          PageViewApp(
              top: _yPosition,
              onChanged: (newIndex) {
                setState(() {
                  _currentIndex = newIndex;
                });
              },
              onPanUpdate: (details) {
                double positionTopLimit = _screenHeight * .24;
                double positionBottomLimit = _screenHeight * .75;
                double middlePosition =
                    (positionTopLimit + positionBottomLimit) / 2;

                setState(() {
                  _yPosition += details.delta.dy;
                  if (_yPosition < positionTopLimit) {
                    _yPosition = positionTopLimit;
                  }
                  if (_yPosition > positionBottomLimit) {
                    _yPosition = positionBottomLimit;
                  }

                  if (_yPosition >= middlePosition && !_showMenu) {
                    _yPosition = positionBottomLimit;
                  } else {
                    if (_yPosition <= middlePosition && _showMenu) {
                      _yPosition = positionTopLimit;
                    }
                  }

                  if (_yPosition == positionBottomLimit) {
                    _showMenu = true;
                  } else {
                    if (_yPosition == positionTopLimit) {
                      _showMenu = false;
                    }
                  }
                });
              }),
        ],
      ),
    );
  }
}
