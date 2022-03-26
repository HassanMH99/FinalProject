import 'package:finalproject/Cart.dart';

import 'package:finalproject/MainPage.dart';

import 'package:finalproject/Services.dart';
import 'package:finalproject/Signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedOption = 0;
  final TextEditingController? _textEditingController = TextEditingController();
  String searchString = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
          child: Text(
            'Services Browser',
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => ZoomDrawer.of(context)!.toggle(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cart()),
                );
              },
              icon: Icon(
                Icons.add_shopping_cart,
                color: Colors.black,
              ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 15,
        currentIndex: _selectedOption,
        selectedIconTheme: IconThemeData(color: Colors.green, size: 30),
        selectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.room_service_outlined,
            ),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedOption = index;
          });
        },
      ),
      body: _Options.elementAt(_selectedOption),
    );
  }
}

List<Widget> _Options = <Widget>[
  MainPage(),
  Services(),
  Signup(),
];
