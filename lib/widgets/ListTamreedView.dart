import 'package:finalproject/widgets/SingleProduct.dart';
import 'package:flutter/material.dart';

class ListTamreedView extends StatelessWidget {
  const ListTamreedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Tamreed Cafe",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            /////////////////////////////////// Text("Catog")
          ],
        ),
        Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SingleProduct(name: "dollar", price: 5, image: "login.png"),
                    SingleProduct(name: "dollar", price: 5, image: "login.png")
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    );
    ;
  }
}
