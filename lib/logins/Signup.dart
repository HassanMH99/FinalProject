import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class Signup extends StatefulWidget {
  static const routename = '/Signup';
  final bool? paswword;

  const Signup({Key? key, this.paswword}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  void initState() {
    // TODO: implement initState
    generateNumber();
    super.initState();
  }
  GlobalKey<FormState> key = GlobalKey();

  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController idcontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passowrdcontroller = TextEditingController();
  bool obscure = true;
  @override
  void dispose() {
    namecontroller.dispose();
    idcontroller.dispose();
    emailcontroller.dispose();
    passowrdcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    final idlay = Container(
      // color: Colors.blue,
      width: 250,
      child: TextFormField(

        controller: idcontroller,
        obscureText: false,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value!.isEmpty) {
            return ('Please Enter Your University ID');
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.numbers,
              color: Colors.green,
            ),
            hintText: 'Enter University ID',
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
      child: TextFormField(
        validator: (value){
          if(value!.isEmpty)
          {
            return 'Please enter Your Name';
          }else{
            return null;
          }
        },
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

      child: TextFormField(
        controller: emailcontroller,
        obscureText: false,
        validator: (value){
          if(value!.isEmpty)
          {
            return 'Please enter Email';
          }else{
            return null;
          }
        },
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
      child: TextFormField(
        validator: (value){
          if(value!.isEmpty)
            {
              return 'Please enter Password';
            }else{
            return null;
          }
        },
        controller: passowrdcontroller,
        obscureText: obscure,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: (){
              setState(() {
                obscure=!obscure;
              });
            },
            icon: Icon(obscure?Icons.visibility_off:Icons.visibility),
          ),
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

              if(key.currentState!.validate()){
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                    email: emailcontroller.text,
                    password: passowrdcontroller.text)
                    .then((value) {
                  FirebaseDatabase.instance.ref('Users').child(FirebaseAuth.instance.currentUser!.uid).set({
                    "Balance": 1000,
                    'id': generateNumber(),
                    'UniversityID': idcontroller.text,
                    "name": namecontroller.text,
                    "email": emailcontroller.text,
                    "password": passowrdcontroller.text,
                    "image": '',
                  });
                  final user = FirebaseAuth.instance.currentUser!;
                  user.sendEmailVerification().then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Please verify email address and then login!')));
                    Navigator.pop(context);
                  });


                }).onError((error, stackTrace) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Register using different email address!')));
                });
                ;
              }

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
                  child: Form(
                    key: key,
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
      ),
    );
  }



  String generateNumber() {
    var rng = new Random();
    var code = rng.nextInt(900000000) + 100000000;
    print(code);
    return "0x"+ code.toString();
  }


}
