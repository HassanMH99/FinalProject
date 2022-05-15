import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    getBalance();
    super.initState();
  }

  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController idcontroller = TextEditingController();

  @override
  void dispose() {
    namecontroller.dispose();
    idcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final idlay = Container(
      // color: Colors.blue,
      width: 250,
      child: TextFormField(
        controller: idcontroller,
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
      width: 250,
      child: TextFormField(
        controller: namecontroller,
        obscureText: false,
        validator: (value) {
          if (value!.isEmpty) {
            return ('Please Enter Your Name');
          } else {
            return null;
          }
        },
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
    final button = Container(
        height: 40,
        width: 100,
        child: ElevatedButton(
            onPressed: () async {
              if (_key.currentState!.validate()) {
                FirebaseDatabase.instance
                    .ref('Users')
                    .child(FirebaseAuth.instance.currentUser!.uid)
                  ..child('UniversityID').set(idcontroller.text);

                FirebaseDatabase.instance
                    .ref('Users')
                    .child(FirebaseAuth.instance.currentUser!.uid)
                  ..child('name').set(namecontroller.text);
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
              'Save',
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
                    key: _key,
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

  Future<String> getBalance() async {
    FirebaseDatabase.instance
        .ref('Users')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      Map<String, dynamic> data = jsonDecode(jsonEncode(value.value));
      print(data);
      setState(() {
        idcontroller.text = data['UniversityID'].toString();
        namecontroller.text = data['name'].toString();
      });
    });
    return '';
  }
}
