import 'package:finalproject/screens/CheckOut.dart';
import 'package:finalproject/screens/ListdoomProduct.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final double price = 5;
  final String name = 'dollar';
  final String image = "login.png";
  //CartScreen({required this.name, required this.price, required this.image});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int count = 1;
  Widget _buildSingleCart() {
    return Container(
      height: 150,
      width: double.infinity,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 130,
                  width: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "images/${widget.image}",
                          ),
                          fit: BoxFit.fill)),
                ),
                Container(
                  height: 140,
                  width: 200,
                  child: ListTile(
                      title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        "\$${widget.price.toString()}",
                        style: TextStyle(
                            color: Color(0xff9b96d6),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Container(
                        height: 35,
                        width: 130,
                        color: Color(0xfff2f2f2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              child: Icon(
                                Icons.remove,
                                color: Colors.black,
                              ),
                              onTap: () {
                                setState(() {
                                  if (count > 1) count--;
                                });
                              },
                            ),
                            Text(
                              count.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              child: Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                              onTap: () {
                                setState(() {
                                  count++;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        width: 100,
        padding: EdgeInsets.only(bottom: 10),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green)),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => CheckOut(
                      image: widget.image,
                      name: widget.name,
                      price: widget.price,
                    )));
          },
          child: Text(
            "Continuos",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.green,
        title: Text(
          "Cart Page",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ListdoomProduct()));
          },
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none,
                color: Colors.black,
              ))
        ],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              _buildSingleCart(),
              _buildSingleCart(),
              _buildSingleCart(),
              _buildSingleCart(),
              _buildSingleCart(),
            ],
          ),
        ],
      ),
    );
  }
}
