/*import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class test1 extends StatefulWidget {
  const test1({Key? key}) : super(key: key);

  @override
  State<test1> createState() => _test1State();
}

class _test1State extends State<test1> {
  CollectionReference _doomproducts =
      FirebaseFirestore.instance.collection("doomproducts");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('TestData'),
          leading: Icon(Icons.backpack),
        ),
        body: StreamBuilder<List<productD>>(
            stream: ReadProduct(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('wew');
                return Text('Somthing Went wrotng! ${snapshot.error}');
              } else if (snapshot.hasData) {
                print('wew1');
                final products = snapshot.data!;
                return ListView(
                  children: products.map(buildProduct).toList(),
                );
              } else {
                print('wew2');
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Stream<List<productD>> ReadProduct() => FirebaseFirestore.instance
      .collection('doomproducts')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => productD.fromJson(doc.data())).toList());
}

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

Widget buildProduct(productD product) => Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          Text(
            '${product.price.toString()}',
            style: TextStyle(color: Colors.black),
          ),
          Text(product.name.toString(), style: TextStyle(color: Colors.black)),
          //Text(product.id.toString(), style: TextStyle(color: Colors.black)),
          //Image(image: NetworkImage('${product.image.toString()}'))
        ],
      ),
    );
*/