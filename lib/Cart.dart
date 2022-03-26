import 'package:finalproject/Home.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

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
          'Cart',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Container(
        height: 200,
        color: Colors.black,
        child: Text('Profile'),
      ),
    );
  }
}
