import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            FirebaseDatabase.instance.ref('Products').child('AdabCafe').push().set({
              "ID": "5HlQsVNpOcrOiuRVk0yh",
              "price": '3',
              "name": "super glue",
              'image':
                  'https://firebasestorage.googleapis.com/v0/b/graduateproject-5ac10.appspot.com/o/I.p%2Fbook%20store%2F0008-super%20glue.png?alt=media&token=b39a433c-4332-4721-af08-7415102d5e0f',
              "category": "sandwich"
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Text('send'),
          ),
        ),
      ),
    );
  }
}
