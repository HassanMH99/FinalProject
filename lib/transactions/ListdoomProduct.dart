import 'package:finalproject/stores/CafeRoom.dart';
import 'package:finalproject/widgets/SingleProduct.dart';
import 'package:flutter/material.dart';

class ListdoomProduct extends StatelessWidget {
  const ListdoomProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Doom Cafe",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CafeRoom()));
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => CartScreen()));
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: <Widget>[
            Column(children: <Widget>[
              Container(
                height: 50,
              ),
              Container(
                height: 500,
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  children: <Widget>[
                    SingleProduct(
                        name: "juice",
                        price: 3,
                        image:
                            "https://firebasestorage.googleapis.com/v0/b/graduateproject-5ac10.appspot.com/o/juice.jpg?alt=media&token=3a0f981e-adf9-4014-a76b-e853fd402db1"),
                    SingleProduct(
                        name: "potato",
                        price: 5,
                        image:
                            "https://firebasestorage.googleapis.com/v0/b/graduateproject-5ac10.appspot.com/o/potato.jpg?alt=media&token=6b4e4b86-fd27-4ca7-9664-2f7dc5cbd2cb"),
                    SingleProduct(
                        name: "Cola",
                        price: 3,
                        image:
                            "https://firebasestorage.googleapis.com/v0/b/graduateproject-5ac10.appspot.com/o/cola.jpg?alt=media&token=ec6296a5-235a-44f8-902b-836892726ecc"),
                    SingleProduct(
                        name: "Finger",
                        price: 12,
                        image:
                            "https://firebasestorage.googleapis.com/v0/b/graduateproject-5ac10.appspot.com/o/finger.jpg?alt=media&token=b56b115e-aefc-4b27-82fa-a8947f6ed846"),
                    SingleProduct(
                        name: "Ice Coffe",
                        price: 5,
                        image:
                            "https://firebasestorage.googleapis.com/v0/b/graduateproject-5ac10.appspot.com/o/icecoffe.jpg?alt=media&token=7a10d99b-b8fa-4f41-8991-96e6eb3beab1"),
                  ],
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
