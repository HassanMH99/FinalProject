import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../primary/Home.dart';
import 'Signup.dart';

class Login extends StatefulWidget {
  static const routename = '/Login';

  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void initState() {
    super.initState();
  }

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final TextEditingController idcontroller = TextEditingController();
  final TextEditingController passowrdcontroller = TextEditingController();

  @override
  void dipose() {
    idcontroller.dispose();
    passowrdcontroller.dispose();
    super.dispose();
  }

  bool obscure = true;

  Widget build(BuildContext context) {
    final idtextfield = Container(
      //color: Colors.green,
      width: MediaQuery.of(context).size.width - 100,
      height: 70,
      child: TextFormField(
        controller: idcontroller,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ('Please Enter Your ID');
          }
          // if (RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9._]+[a-z]').hasMatch(value)) {
          // return ('Please Enter The valid ID');
          //}
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_circle,
              color: Colors.green,
            ),
            hintText: 'Email address',
            hintStyle: TextStyle(color: Color.fromARGB(143, 25, 26, 25)),
            filled: true,
            fillColor: Colors.white70,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide:
                  BorderSide(color: Color.fromARGB(207, 25, 26, 25), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide:
                    BorderSide(color: Color.fromARGB(207, 25, 26, 25)))),
      ),
    );

    final passwordtextfield = Container(
        // color: Colors.blue,
        width: MediaQuery.of(context).size.width - 100,
        height: 70,
        child: TextFormField(
          controller: passowrdcontroller,
          validator: (value) {
            RegExp regexp = new RegExp(r'^.(6,)$');
            if (value!.isEmpty) {
              return ('Please Enter Your Password');
            }
            if (regexp.hasMatch(value)) {
              return ('Please Enter The valid Password more than 6 charecter');
            }
            return null;
          },
          obscureText: obscure,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
                icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
              ),
              prefixIcon: Icon(
                Icons.vpn_key,
                color: Colors.green,
              ),
              hintText: 'Password',
              hintStyle: TextStyle(color: Color.fromARGB(143, 25, 26, 25)),
              filled: true,
              fillColor: Colors.white70,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                    color: Color.fromARGB(207, 25, 26, 25), width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(207, 25, 26, 25)))),
        ));
    final buttonlogin = ElevatedButton(
        onPressed: () async {
          if (_formkey.currentState!.validate()) {
            await FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: idcontroller.text, password: passowrdcontroller.text)
                .then((value) {
              if (FirebaseAuth.instance.currentUser!.emailVerified) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        Text('Please verify email address and then login')));
              }
            }).onError((error, stackTrace) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Wrong email or address')));
            });
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
            padding: MaterialStateProperty.all(EdgeInsets.all(15)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Color.fromARGB(207, 25, 26, 25))))),
        child: Container(
          width: 200,
          child: Text(
            'Login',
            style: TextStyle(
              color: Color.fromARGB(207, 25, 26, 25),
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
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
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Color.fromARGB(207, 25, 26, 25))))),
        child: Container(
          width: 200,
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: Color.fromARGB(207, 25, 26, 25),
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
        ));

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Form(
            key: _formkey,
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
                reverse: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(vertical: 6)),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: 200,
                      height: 100,
                      child: Image.asset(
                        'images/bzu1.png',
                        fit: BoxFit.contain,
                      ),
                    ),

                    //idtext,
                    SizedBox(
                      height: 100,
                    ),
                    idtextfield,

                    // passwordtext,
                    SizedBox(
                      height: 10,
                    ),
                    passwordtextfield,
                    SizedBox(
                      height: 10,
                    ),
                    buttonlogin,
                    SizedBox(
                      height: 15,
                    ),
                    buttonsignup,
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: Color.fromARGB(207, 25, 26, 25),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
