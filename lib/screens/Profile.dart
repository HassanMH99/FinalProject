import 'package:finalproject/Home.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    final imagelabel = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height * 1 / 30,
          width: width * 1 / 15,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage("images/c.png"))),
        ),
        Container(
          height: height * 1 / 30,
          width: width * 1 / 11,
          color: Color.fromARGB(0, 33, 149, 243),
          child: Center(
            child: Text(
              "1000",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          width: width * 1 / 100,
        ),
        Container(
          height: height * 1 / 5,
          width: width * 1 / 2,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fitHeight, image: AssetImage("images/p2.jpg"))),
        ),
      ],
    );
    final namelabel = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: height * 1 / 20,
          width: width * 1 / 4,
          // color: Color.fromARGB(225, 25, 26, 25),
          decoration: BoxDecoration(
              color: Color.fromARGB(225, 25, 26, 25),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0))),
          child: Center(
            child: Text(
              "Name:",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ),
        Container(
          height: height * 1 / 20,
          width: width * 1 / 1.55,
          decoration: BoxDecoration(
              color: Color.fromARGB(134, 25, 26, 25),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0))),
          child: Center(
            child: Text(
              "Mohammad Hassan",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          //color: Color.fromARGB(127, 25, 26, 25),
        ),
      ],
    );
    final idlabel = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: height * 1 / 20,
          width: width * 1 / 4,
          //color: Colors.black,
          decoration: BoxDecoration(
              color: Color.fromARGB(225, 25, 26, 25),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0))),
          child: Center(
            child: Text(
              "ID Student:",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ),
        Container(
          height: height * 1 / 20,
          width: width * 1 / 1.55,
          decoration: BoxDecoration(
              color: Color.fromARGB(134, 25, 26, 25),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0))),
          child: Center(
            child: Text(
              "1171948",
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          //color: Color.fromARGB(127, 25, 26, 25),
        ),
      ],
    );
    final emaillabel = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: height * 1 / 20,
          width: width * 1 / 4,
          //color: Colors.black,
          decoration: BoxDecoration(
              color: Color.fromARGB(225, 25, 26, 25),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0))),
          child: Center(
            child: Text(
              "Email:",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ),
        Container(
          height: height * 1 / 20,
          width: width * 1 / 1.55,
          decoration: BoxDecoration(
              color: Color.fromARGB(134, 25, 26, 25),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0))),
          child: Center(
            child: Text(
              "Cride.it1999@gmail.com",
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          //color: Color.fromARGB(127, 25, 26, 25),
        ),
      ],
    );
    final addresslabel = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: height * 1 / 20,
          width: width * 1 / 4,
          // color: Colors.black,
          decoration: BoxDecoration(
              color: Color.fromARGB(225, 25, 26, 25),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0))),
          child: Center(
            child: Text(
              "Address:",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ),
        Container(
          height: height * 1 / 20,
          width: width * 1 / 1.55,
          decoration: BoxDecoration(
              color: Color.fromARGB(134, 25, 26, 25),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0))),
          child: Center(
            child: Text(
              "0xf2323",
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          // color: Color.fromARGB(127, 25, 26, 25),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            }),
        backgroundColor: Color.fromARGB(207, 25, 26, 25),
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              imagelabel,
              SizedBox(
                height: height * 1 / 40,
              ),
              namelabel,
              SizedBox(
                height: height * 1 / 40,
              ),
              idlabel,
              SizedBox(
                height: height * 1 / 40,
              ),
              emaillabel,
              SizedBox(
                height: height * 1 / 40,
              ),
              addresslabel
            ],
          ),
        ),
      ),
    );
  }
}
