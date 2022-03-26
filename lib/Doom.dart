import 'package:finalproject/CafeRoom.dart';
import 'package:flutter/material.dart';

class Doom extends StatelessWidget {
  const Doom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Welcome To Doom Cafeteria'),
        leading: IconButton(
          icon: Icon(Icons.backspace),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CafeRoom()),
            );
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/playstore.png"), fit: BoxFit.fill),
        ),  
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.5),
          itemCount: DoomItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        DoomItems[index].name,
                        style: TextStyle(fontSize: 25),
                      ),
                      Container(
                        width: 5,
                      ),
                      Text(
                        "\$ ${DoomItems[index].price}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 70,
                        width: 120,
                        color: Colors.blue,
                        child: Image.asset(
                          "${DoomItems[index].image}",
                          fit: BoxFit.fill,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.black,
                          )),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    ));
  }
}

class DoomItem {
  String name;
  double price;
  String image;
  DoomItem({required this.name, required this.price, required this.image});
}

List<DoomItem> DoomItems = [
  DoomItem(name: 'Dollar', price: 10, image: 'images/login.png'),
  DoomItem(name: 'Pizza', price: 7, image: 'images/login.png'),
  DoomItem(name: 'Potato', price: 5, image: 'images/login.png'),
  DoomItem(name: 'Colla', price: 3, image: 'images/login.png'),
  DoomItem(name: 'Cookies', price: 3, image: 'images/login.png'),
];
