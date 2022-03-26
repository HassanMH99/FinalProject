import 'package:finalproject/Doom.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class CafeRoom extends StatelessWidget {
  const CafeRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Text(
              'Cafeterias',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            icon: Icon(Icons.backspace),
            iconSize: 30,
          ),
        ),
        body: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/playstore.png"), fit: BoxFit.fill),
            ),
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.7),
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.green,
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    textDirection: TextDirection.rtl,
                    clipBehavior: Clip.hardEdge,
                    children: [
                      Image.asset(
                        "images/login.png",
                        fit: BoxFit.fill,
                      ),
                      Center(
                        child: Text(
                          "Doom",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              textBaseline: TextBaseline.alphabetic),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Doom()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.green,
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    textDirection: TextDirection.rtl,
                    clipBehavior: Clip.hardEdge,
                    children: [
                      Image.asset(
                        "images/login.png",
                        fit: BoxFit.fill,
                      ),
                      Center(
                        child: Text(
                          "Adab",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              textBaseline: TextBaseline.alphabetic),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Doom()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.green,
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    textDirection: TextDirection.rtl,
                    clipBehavior: Clip.hardEdge,
                    children: [
                      Image.asset(
                        "images/login.png",
                        fit: BoxFit.fill,
                      ),
                      Center(
                        child: Text(
                          "Science Cafeteria",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              textBaseline: TextBaseline.alphabetic),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Doom()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.green,
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    textDirection: TextDirection.rtl,
                    clipBehavior: Clip.hardEdge,
                    children: [
                      Image.asset(
                        "images/login.png",
                        fit: BoxFit.fill,
                      ),
                      Center(
                        child: Text(
                          "كافيتيريا التمريض",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              textBaseline: TextBaseline.alphabetic),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Doom()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Cafeterias {
  String Name;
  String Image;
  Cafeterias({required this.Name, required this.Image});
}

List<Cafeterias> Cafeteria = [
  Cafeterias(Name: 'Dollar', Image: 'images/login.png'),
  Cafeterias(Name: 'Pizza', Image: 'images/login.png'),
  Cafeterias(Name: 'Potato', Image: 'images/login.png'),
  Cafeterias(Name: 'Colla', Image: 'images/login.png'),
  Cafeterias(Name: 'Cookies', Image: 'images/login.png'),
];
