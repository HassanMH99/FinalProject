import 'package:finalproject/primary/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Transaction extends StatelessWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.backspace),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              }),
          title: Text(
            'Transaction',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: FirebaseAnimatedList(
          query: FirebaseDatabase.instance
              .ref('Transactions')
              .child(FirebaseAuth.instance.currentUser!.uid),
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            return Text('s');
          },
        ));
  }
}
