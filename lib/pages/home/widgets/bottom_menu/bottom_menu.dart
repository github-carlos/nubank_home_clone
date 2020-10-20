import 'package:flutter/material.dart';
import 'file:///D:/AndroidStudioProjects/nubank_interface_clone/lib/pages/home/widgets/bottom_menu/item_menu_bottom.dart';

class BottomMenu extends StatefulWidget {
  final bool showMenu;

  BottomMenu({this.showMenu});

  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  Tween _tween;
  @override
  void initState() {
    super.initState();
    _tween = Tween<double>(begin: 80, end: 80);
    delayedAnimation();
  }
  Future<void> delayedAnimation() async {
    Future.delayed(Duration(milliseconds: 400), () {
      setState(() {
        _tween = Tween<double>(begin: 80, end: 0);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 600),
      tween: _tween,
      builder: (context, value, child) {
        return AnimatedPositioned(
          duration: Duration(milliseconds: 200),
          bottom: !widget.showMenu ? MediaQuery.of(context).padding.bottom : 0,
          left: value,
          right: value * -1,
          height: MediaQuery.of(context).size.height * 0.15,
          child: IgnorePointer(
            ignoring: widget.showMenu,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              opacity: widget.showMenu ? 0 : 1,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  ItemMenuBottom(icon: Icons.person_add, text: 'indicar amigos',),
                  ItemMenuBottom(icon: Icons.phone_android, text: 'Recarga de celular',),
                  ItemMenuBottom(icon: Icons.chat, text: 'Cobrar',),
                  ItemMenuBottom(icon: Icons.monetization_on, text: 'Empréstimos',),
                  ItemMenuBottom(icon: Icons.move_to_inbox, text: 'Depositar',),
                  ItemMenuBottom(icon: Icons.mobile_screen_share, text: 'Transferir',),
                  ItemMenuBottom(icon: Icons.format_align_center, text: 'Ajustar limite',),
                  ItemMenuBottom(icon: Icons.chrome_reader_mode, text: 'Pagar',),
                  ItemMenuBottom(icon: Icons.lock_open, text: 'Bloquear cartão',),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
