import 'package:finalproject/Libraries.dart';
import 'package:flutter/material.dart';

import 'CafeRoom.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/playstore.png"), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(5.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 120,
                color: Colors.green,
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "images/login.png",
                      fit: BoxFit.fill,
                    ),
                    Center(
                      child: Text(
                        "Cafeterias",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CafeRoom()));
                      },
                    )
                  ],
                ),
              ),
              Container(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 120,
                color: Colors.green,
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "images/login.png",
                      fit: BoxFit.fill,
                    ),
                    Center(
                      child: Text(
                        "Libraries",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Libraries()));
                      },
                    )
                  ],
                ),
              ),
              Container(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 120,
                color: Colors.green,
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "images/login.png",
                      fit: BoxFit.fill,
                    ),
                    Center(
                      child: Text(
                        "Book Store",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CafeRoom()));
                      },
                    )
                  ],
                ),
              ),
              Container(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 120,
                color: Colors.green,
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "images/login.png",
                      fit: BoxFit.fill,
                    ),
                    Center(
                      child: Center(
                        child: Text(
                          "Acadimical Services",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CafeRoom()));
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
