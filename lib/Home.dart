import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'MainScreen.dart';
import 'MenuScreen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      mainScreen: MainScreen(),
      menuScreen: MenuScreen(),
      style: DrawerStyle.Style7,
    );
  }
}
