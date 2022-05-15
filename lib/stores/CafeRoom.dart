import 'package:finalproject/stores/cafeteria_shops.dart';
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
                MaterialPageRoute(builder: (context) => CafeteriaShop(cafe: 'Doom')),
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
                MaterialPageRoute(builder: (context) => CafeteriaShop(cafe: 'Adab',)),
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
                MaterialPageRoute(builder: (context) => CafeteriaShop(cafe: 'Temre',)),
              );
            },
          ),
        ],
      ),
    );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Text(
              'Cafeterias',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
          color: Color(0xffcbd8c8)),
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
