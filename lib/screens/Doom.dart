import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/provider/productdoom.dart';
import 'package:finalproject/screens/CafeRoom.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Doom extends StatelessWidget {
  const Doom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    TextEditingController idController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController ImageUrlController = TextEditingController();
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Doom Cafeteria',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              backgroundColor: Colors.green,
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CafeRoom()));
                },
                icon: Icon(
                  Icons.backspace,
                  color: Colors.black,
                ),
                iconSize: 30,
              ),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView(children: [
                TextField(
                  controller: idController,
                  decoration: InputDecoration(hintText: 'ID'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: 'name'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: priceController,
                  decoration: InputDecoration(hintText: 'price'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: ImageUrlController,
                  decoration: InputDecoration(hintText: 'ImageUrl'),
                ),
                SizedBox(
                  height: 10,
                ),
              ]),
            )));
  }
}
