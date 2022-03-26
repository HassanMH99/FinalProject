import 'package:finalproject/Libraries.dart';
import 'package:flutter/material.dart';

class Library2 extends StatelessWidget {
  const Library2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Welcome To Second Library'),
        leading: IconButton(
          icon: Icon(Icons.backspace),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Libraries()),
            );
          },
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.6),
        itemCount: Library_22.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      Library_22[index].name,
                      style: TextStyle(fontSize: 25),
                    ),
                    Container(
                      width: 5,
                    ),
                    // Text(
                    //  "\$ ${Library_22[index].price}",
                    // style: TextStyle(fontSize: 20),
                    // ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: 180,
                      color: Colors.blue,
                      child: Image.asset(
                        "${Library_22[index].image}",
                        fit: BoxFit.fill,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_shopping_cart,
                          color: Colors.black,
                        ))
                  ],
                )
              ],
            ),
          );
        },
      ),
    ));
  }
}

class Library_2 {
  String name;
  double price;
  String image;
  Library_2({required this.name, required this.price, required this.image});
}

List<Library_2> Library_22 = [
  Library_2(name: 'Calculas', price: 5, image: 'images/login.png'),
  Library_2(name: 'Physics', price: 5, image: 'images/login.png'),
  Library_2(name: 'Mangment', price: 5, image: 'images/login.png'),
  Library_2(name: 'StoryLine', price: 5, image: 'images/login.png'),
  Library_2(name: 'Lost Time', price: 5, image: 'images/login.png'),
];
