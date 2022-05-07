import 'package:finalproject/Home.dart';
import 'package:finalproject/screens/Doom.dart';
import 'package:flutter/material.dart';

class CafeRoom extends StatelessWidget {
  const CafeRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final doom = Container(
      width: width - 0.05 * width,
      height: height * 1 / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: new DecorationImage(
          image: new AssetImage("images/ca1.png"),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        textDirection: TextDirection.rtl,
        clipBehavior: Clip.hardEdge,
        children: [
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
    );
    final adab = Container(
      width: width - 0.05 * width,
      height: height * 1 / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: new DecorationImage(
          image: new AssetImage("images/ca2.png"),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        textDirection: TextDirection.rtl,
        clipBehavior: Clip.hardEdge,
        children: [
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
    );
    final tamred = Container(
      width: width - 0.05 * width,
      height: height * 1 / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: new DecorationImage(
          image: new AssetImage("images/ca3.png"),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        textDirection: TextDirection.rtl,
        clipBehavior: Clip.hardEdge,
        children: [
          Center(
            child: Text(
              "Tamreed Cafeteria",
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
    );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(207, 25, 26, 25),
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
            icon: Icon(Icons.home),
            iconSize: 25,
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 73, 230, 0),
              Color.fromARGB(255, 13, 78, 0),
            ],
          )),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 1 / 50,
                ),
                doom,
                SizedBox(
                  height: height * 1 / 50,
                ),
                adab,
                SizedBox(
                  height: height * 1 / 50,
                ),
                tamred
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
