import 'package:finalproject/screens/CafeRoom.dart';
import 'package:finalproject/screens/Libraries.dart';
import 'package:finalproject/screens/Library1.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 73, 230, 0),
            Color.fromARGB(255, 13, 78, 0),
          ],
        )),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: new DecorationImage(
                    image: new AssetImage("images/cafeteria.png"),
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.centerLeft,
                  ),
                  color: Color.fromARGB(207, 25, 26, 25),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Center(
                      child: Text(
                        "\t\t\t\t\t\tCafeterias",
                        style: TextStyle(
                            color: Color.fromARGB(255, 245, 255, 236),
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: new DecorationImage(
                    image: new AssetImage("images/library.png"),
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.centerLeft,
                  ),
                  color: Color.fromARGB(207, 25, 26, 25),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Center(
                      child: Text(
                        "\t\t\t\tLibrary",
                        style: TextStyle(
                            color: Color.fromARGB(255, 245, 255, 236),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Library1()));
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: new DecorationImage(
                    image: new AssetImage("images/book.png"),
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.centerLeft,
                  ),
                  color: Color.fromARGB(207, 25, 26, 25),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Center(
                      child: Text(
                        "\t\t\t\t\t\t\t\tBook Store",
                        style: TextStyle(
                            color: Color.fromARGB(255, 245, 255, 236),
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: new DecorationImage(
                    image: new AssetImage("images/ac.png"),
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.centerLeft,
                  ),
                  color: Color.fromARGB(207, 25, 26, 25),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Center(
                      child: Center(
                        child: Text(
                          "\t\t\t\t\t\t\t\t\tAcadimical \n \t\t\t\t\t\t\t\tServices",
                          style: TextStyle(
                              color: Color.fromARGB(255, 245, 255, 236),
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
