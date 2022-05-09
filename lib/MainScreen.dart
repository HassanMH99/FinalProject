import 'package:finalproject/MainPage.dart';
import 'package:finalproject/screens/CartScreen.dart';

import 'package:finalproject/screens/Services.dart';
import 'package:finalproject/screens/Signup.dart';
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
        backgroundColor: Color.fromARGB(255, 25, 26, 25),
        title: Center(
          child: Text(
            'Services Browser',
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Color.fromARGB(255, 230, 255, 225),
          onPressed: () => ZoomDrawer.of(context)!.toggle(),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
              icon: Icon(
                Icons.add_shopping_cart,
                color: Color.fromARGB(255, 230, 255, 225),
              ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 10,
        currentIndex: _selectedOption,
        backgroundColor: Color.fromARGB(255, 25, 26, 25),
        selectedIconTheme:
            IconThemeData(color: Color.fromARGB(255, 237, 255, 237), size: 30),
        selectedItemColor: Color.fromARGB(255, 237, 255, 237),
        unselectedItemColor: Color.fromARGB(71, 237, 255, 237),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
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
