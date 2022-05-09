import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String name;
  final double price;
  final String image;
  const SingleProduct(
      {required this.name, required this.price, required this.image});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 250,
        width: 170,
        // color: Colors.blue,
        child: Column(
          children: <Widget>[
            Container(
              height: 190,
              width: 160,
              decoration: BoxDecoration(
                  //color: Colors.blueGrey,
                  image: DecorationImage(
                      image: NetworkImage("$image"), fit: BoxFit.fill)),
            ),
            Text(
              "\$ ${price.toString()}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Color(0xff9b96d6),
              ),
            ),
            Text(
              name,
              style: TextStyle(fontSize: 17),
            )
          ],
        ),
      ),
    );
  }
}
