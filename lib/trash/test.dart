/*import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/Home.dart';
import 'package:flutter/material.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  TextEditingController idcontrol = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "CafeRoom",
              style: TextStyle(color: Colors.black),
            ),
            elevation: 0.0,
            backgroundColor: Colors.green,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.backspace,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Home()));
              },
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                ),
              ),
            ]),
        body: StreamBuilder(
            stream: readProduct(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final prod = snapshot.data!;
                return ListView(
                  children: prod.map(buildProduct).toList(),
                );
              }
            }));
  }
}

Widget buildProduct(productD prod1) => ListTile(
      leading: CircleAvatar(
        child: Text('${prod1.price}'),
      ),
      title: Text(prod1.name),
    );

Stream<List<productD>> readProduct() => FirebaseFirestore.instance
    .collection("doomproducts")
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => productD.fromJson(doc.data())).toList());

class productD {
  String id;
  String name;
  String price;
  String image;
  productD(
      {required this.id,
      required this.name,
      required this.price,
      required this.image});

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'price': price, 'image': image};

  static productD fromJson(Map<String, dynamic> data) => productD(
      id: data['id'],
      name: data['name'],
      price: data['price'],
      image: data['image']);
}
*/
