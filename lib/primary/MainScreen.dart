import 'package:finalproject/primary/MainPage.dart';
import 'package:finalproject/profile/Profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:iconly/iconly.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../transactions/transactions.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedOption = 0;
  String searchString = "";

  List<SalomonBottomBarItem> barItems() {
    List<SalomonBottomBarItem> items = [];
    items.add(SalomonBottomBarItem(
        icon: Icon(
          _selectedOption == 0 ? IconlyBold.home : IconlyBroken.home,
          semanticLabel: 'Home',
          size: 20,
        ),
        title: const Text('Home', style: TextStyle(fontSize: 12))));

    items.add(SalomonBottomBarItem(
        icon: Icon(_selectedOption == 1 ? IconlyBold.graph : IconlyBroken.graph,
            semanticLabel: 'Transactions'),
        title: const Text('Transactions', style: TextStyle(fontSize: 12))));

    items.add(SalomonBottomBarItem(
        icon: Icon(
          _selectedOption == 2 ? IconlyBold.profile : IconlyBroken.profile,
          semanticLabel: 'Profile',
          size: 20,
        ),
        title: const Text('Profile', style: TextStyle(fontSize: 12))));
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcbd8c8),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          _selectedOption == 0
              ? "Home"
              : _selectedOption == 1
                  ? "Transactions"
                  : 'Profile',
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Color.fromARGB(255, 230, 255, 225),
          onPressed: () => ZoomDrawer.of(context)!.toggle(),
        ),
        actions: [],
      ),
      bottomNavigationBar: ClipRRect(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SalomonBottomBar(
                unselectedItemColor: Colors.white,
                currentIndex: _selectedOption,
                selectedItemColor: Colors.white,
                onTap: (i) => setState(() => _selectedOption = i),
                items: barItems()),
          ),
          margin: const EdgeInsets.only(top: 6.0),
          //Same as `blurRadius` i guess
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            color: Colors.green,

          ),
        ),
      ),
      body: _Options.elementAt(_selectedOption),
    );
  }
}

List<Widget> _Options = <Widget>[
  MainPage(),
  Transactions(),
  Profile(),
];
