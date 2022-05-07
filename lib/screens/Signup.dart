import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/screens/Login.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  static const routename = '/Signup';
  final bool? paswword;
  const Signup({Key? key, this.paswword}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController idcontroller = TextEditingController();
    final TextEditingController namecontroller = TextEditingController();
    final TextEditingController emailcontroller = TextEditingController();
    final TextEditingController passowrdcontroller = TextEditingController();

    final idlay = Container(
      // color: Colors.blue,
      width: 250,
      height: 50,
      child: TextFormField(
        controller: idcontroller,
        obscureText: false,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value!.isEmpty) {
            return ('Please Enter Your ID');
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_circle,
              color: Colors.green,
            ),
            hintText: 'Enter ID number',
            hintStyle: TextStyle(color: Color.fromARGB(120, 25, 26, 25)),
            filled: true,
            fillColor: Colors.white70,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                borderSide: BorderSide(color: Colors.black))),
      ),
    );
    final namelay = Container(
      // color: Colors.blue,
      width: 250,
      height: 50,
      child: TextFormField(
        controller: namecontroller,
        obscureText: false,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_circle,
              color: Colors.green,
            ),
            hintText: 'Enter Your Name',
            hintStyle: TextStyle(color: Color.fromARGB(120, 25, 26, 25)),
            filled: true,
            fillColor: Colors.white70,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                borderSide: BorderSide(color: Colors.black))),
      ),
    );
    final emaillay = Container(
      // color: Colors.blue,
      width: 250,
      height: 50,

      child: TextFormField(
        controller: emailcontroller,
        obscureText: false,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: Colors.green,
            ),
            hintText: 'Enter Your Email',
            hintStyle: TextStyle(color: Color.fromARGB(120, 25, 26, 25)),
            filled: true,
            fillColor: Colors.white70,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                borderSide: BorderSide(color: Colors.black))),
      ),
    );
    final passwordlay = Container(
      // color: Colors.blue,
      width: 250,
      height: 50,
      child: TextFormField(
        controller: passowrdcontroller,
        obscureText: false,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.vpn_key,
              color: Colors.green,
            ),
            hintText: 'Enter Your password',
            hintStyle: TextStyle(color: Color.fromARGB(120, 25, 26, 25)),
            filled: true,
            fillColor: Colors.white70,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                borderSide: BorderSide(color: Colors.black))),
      ),
    );
    final button = Container(
        height: 40,
        width: 100,
        child: ElevatedButton(
            onPressed: () async {
              await FirebaseFirestore.instance.collection("Users").add({
                "iD": idcontroller.text,
                "name": namecontroller.text,
                "email": emailcontroller.text,
                "password": passowrdcontroller.text,
              });
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.black)))),
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            )));

    bool _isHidden1 = true;
    // var _togglePasswordView;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
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
            child: SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                      Container(
                          height: 100,
                          width: 200,
                          child: Image.asset(
                            'images/bzu1.png',
                            fit: BoxFit.contain,
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      idlay,
                      SizedBox(
                        height: 15,
                      ),
                      namelay,
                      SizedBox(
                        height: 15,
                      ),
                      emaillay,
                      SizedBox(
                        height: 15,
                      ),
                      passwordlay,
                      SizedBox(
                        height: 15,
                      ),
                      button
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
