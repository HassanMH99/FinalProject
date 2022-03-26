import 'package:finalproject/Libraries.dart';
import 'package:flutter/material.dart';

class Library3 extends StatelessWidget {
  const Library3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Welcome to Third Library'),
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
        itemCount: Library_1.length,
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
                      Library_1[index].name,
                      style: TextStyle(fontSize: 25),
                    ),
                    Container(
                      width: 5,
                    ),
                    // Text(
                    //  "\$ ${Library_1[index].price}",
                    //  style: TextStyle(fontSize: 20),
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
                        "${Library_1[index].image}",
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

class Library {
  String name;
  double price;
  String image;
  Library({required this.name, required this.price, required this.image});
}

List<Library> Library_1 = [
  Library(name: 'Calculas', price: 5, image: 'images/login.png'),
  Library(name: 'Physics', price: 5, image: 'images/login.png'),
  Library(name: 'Mangment', price: 5, image: 'images/login.png'),
  Library(name: 'StoryLine', price: 5, image: 'images/login.png'),
  Library(name: 'Lost Time', price: 5, image: 'images/login.png'),
];
