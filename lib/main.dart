import 'package:finalproject/Cart.dart';

import 'package:finalproject/screens/CafeRoom.dart';
import 'package:finalproject/screens/Doom.dart';
import 'package:finalproject/screens/Libraries.dart';
import 'package:finalproject/screens/Library1.dart';
import 'package:finalproject/screens/Library2.dart';
import 'package:finalproject/screens/Library3.dart';
import 'package:finalproject/screens/Login.dart';
import 'package:finalproject/screens/Profile.dart';
import 'package:finalproject/screens/Services.dart';
import 'package:finalproject/screens/Signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  //late List<Item> items = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Task(items: items),
      home: Login(), debugShowCheckedModeBanner: false,
      // routes: {
      // Login.routename: (_) => Login(),
      // Signup.routename: (_) => Signup(),
      // CafeRoom.routename: (_) => CafeRoom(),
      // Doom.routename: (_) => Doom(),
      // Libraries.routename: (_) => Libraries(),
      // Library1.routename: (_) => Library1(),
      // Library2.routename: (_) => Library2(),
      // Library3.routename: (_) => Library3(),
      // Cart.routename: (_) => Cart(),
      // Profile.routename: (_) => Profile(),
      // Services.routename: (_) => Services(),
      //},
    );
  }
}
