import 'package:finalproject/Login.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
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
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_circle,
              color: Colors.green,
            ),
            hintText: 'Enter ID number',
            hintStyle: TextStyle(color: Colors.green),
            filled: true,
            fillColor: Colors.white70,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
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
            hintStyle: TextStyle(color: Colors.green),
            filled: true,
            fillColor: Colors.white70,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
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
            hintStyle: TextStyle(color: Colors.green),
            filled: true,
            fillColor: Colors.white70,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
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
            hintStyle: TextStyle(color: Colors.green),
            filled: true,
            fillColor: Colors.white70,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                borderSide: BorderSide(color: Colors.black))),
      ),
    );
    final button = ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
            padding: MaterialStateProperty.all(EdgeInsets.all(15)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.black)))),
        child: Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ));

    bool _isHidden1 = true;
    // var _togglePasswordView;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/playstore.png"),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                        Container(
                            height: 100,
                            width: 100,
                            child: Image.asset('images/login.png')),
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
      ),
    );
  }
}
