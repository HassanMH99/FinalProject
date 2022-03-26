import 'package:finalproject/Home.dart';
import 'package:finalproject/Library1.dart';
import 'package:finalproject/Library2.dart';
import 'package:finalproject/Library3.dart';
import 'package:flutter/material.dart';

class Libraries extends StatelessWidget {
  const Libraries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              icon: Icon(Icons.backspace)),
          title: Text(
            'Libraries',
          ),
        ),
        body: Center(
            child: Container(
          width: double.infinity,
          height: double.infinity,
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/playstore.png"), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Container(
                height: 160,
                width: double.infinity,
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
                        "Library 1",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            textBaseline: TextBaseline.alphabetic),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Library1()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              Container(
                height: 160,
                width: double.infinity,
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
                        "Library 2",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            textBaseline: TextBaseline.alphabetic),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Library2()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              Container(
                height: 160,
                width: double.infinity,
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
                        "Library 3",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            textBaseline: TextBaseline.alphabetic),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Library3()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
