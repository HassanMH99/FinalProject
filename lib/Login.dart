import 'package:finalproject/Home.dart';
import 'package:finalproject/Signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/myText.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final TextEditingController idcontroller = TextEditingController();
  final TextEditingController passowrdcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final idtext = Container(
      child: Text(
        'ID Number',
        style: TextStyle(color: Colors.black, fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );

    final idtextfield = Container(
      //color: Colors.green,
      width: 200,
      height: 50,
      child: TextFormField(
        controller: idcontroller,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your ID");
          }
          if (RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9._]+[a-z]").hasMatch(value)) {
            return ("Please Enter The valid ID");
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_circle,
              color: Colors.green,
            ),
            hintText: 'ID Number',
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
    final passwordtext = Container(
      //color: Colors.blueAccent,
      child: Text(
        'Password',
        style: TextStyle(color: Colors.black, fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
    final passwordtextfield = Container(
      // color: Colors.blue,
      width: 200,
      height: 50,
      child: TextFormField(
        controller: passowrdcontroller,
        validator: (value) {
          RegExp regexp = new RegExp(r'^.(6,)$');
          if (value!.isEmpty) {
            return ("Please Enter Your Password");
          }
          if (regexp.hasMatch(value)) {
            return ("Please Enter The valid Password more than 6 charecter");
          }
          return null;
        },
        obscureText: true,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.vpn_key,
              color: Colors.green,
            ),
            hintText: 'Password',
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
    final buttonlogin = ElevatedButton(
        onPressed: () {
          //signIn(idcontroller.text, passowrdcontroller.text);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
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
          'Login',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ));
    final buttonsignup = ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Signup()),
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

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/playstore.png"), fit: BoxFit.cover),
            ),
            child: SingleChildScrollView(
              reverse: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.symmetric(vertical: 6)),
                  Container(
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      'images/login.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  idtext,
                  SizedBox(
                    height: 10,
                  ),
                  idtextfield,
                  SizedBox(
                    height: 10,
                  ),
                  passwordtext,
                  SizedBox(
                    height: 10,
                  ),
                  passwordtextfield,
                  SizedBox(
                    height: 10,
                  ),
                  buttonlogin,
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Forget Password?',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  buttonsignup,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /* void signIn(String id, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: id, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Home())),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: "Error");
      });
    }
  }*/
}
