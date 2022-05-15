import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'CartScreen.dart';

enum FilterOption { favorate, ALL }

class CafeteriaShop extends StatefulWidget {
  const CafeteriaShop({Key? key, required this.cafe}) : super(key: key);
  final String cafe;

  @override
  State<CafeteriaShop> createState() => _CafeteriaShopState();
}

class _CafeteriaShopState extends State<CafeteriaShop> {
  String count = '0';
  String category = 'meal';

  Future<String> getCartCount() async {
    FirebaseDatabase.instance
        .ref('Cart')
        .child(widget.cafe == "Doom"
            ? "DoomCafe"
            : widget.cafe == "Adab"
                ? "AdabCafe"
                : "TemreCafe")
        .child(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      print(value.children.length.toString());
      setState(() {
        count = value.children.length.toString();
      });
    });
    return count;
  }

  @override
  void initState() {
    getCartCount();
    // TODO: implement initState
    super.initState();
  }

  //var _isInit = false;
  bool meals = true, sandwiches = false, snacks = false, drinks = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.green.withOpacity(0.2),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                if (count != '0') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (c) => CartScreen(
                            store: widget.cafe,
                          )));
                }
              },
              icon: FutureBuilder(
                  future: getCartCount(),
                  builder: (conte, xt) {
                    return Badge(
                      child: Icon(Icons.shopping_cart),
                      badgeContent: Text(
                        count,
                        style: TextStyle(color: Colors.white),
                      ),
                      badgeColor: Colors.green,
                    );
                  }))
        ],
        backgroundColor: Colors.green,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            widget.cafe,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          // decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       begin: Alignment.topRight,
          //       end: Alignment.bottomLeft,
          //       colors: [
          //         Color.fromARGB(255, 73, 230, 0),
          //         Color.fromARGB(255, 13, 78, 0),
          //       ],
          //     )),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async {
                        setState(() {
                          meals = true;
                          sandwiches = false;
                          snacks = false;
                          drinks = false;
                          category = 'meal';
                        });
                      },
                      child: Container(
                        height: 32,
                        width: 75,
                        child: Center(
                          child: Text(
                            'Meals',
                            style: TextStyle(
                                color: meals ? Colors.white : Colors.green),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: meals
                                ? Colors.green
                                : Colors.green.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          meals = false;
                          sandwiches = true;
                          snacks = false;
                          drinks = false;
                          category = 'sandwich';
                        });
                      },
                      child: Container(
                        height: 32,
                        width: 95,
                        child: Center(
                          child: Text(
                            'Sandwiches',
                            style: TextStyle(
                                color:
                                    sandwiches ? Colors.white : Colors.green),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: sandwiches
                                ? Colors.green
                                : Colors.green.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          meals = false;
                          sandwiches = false;
                          snacks = false;
                          drinks = true;
                          category = 'drink';
                        });
                      },
                      child: Container(
                        height: 32,
                        width: 75,
                        child: Center(
                          child: Text(
                            'Drinks',
                            style: TextStyle(
                                color: drinks ? Colors.white : Colors.green),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: drinks
                                ? Colors.green
                                : Colors.green.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          meals = false;
                          sandwiches = false;
                          snacks = true;
                          drinks = false;
                          category = 'snack';
                        });
                      },
                      child: Container(
                        height: 32,
                        width: 75,
                        child: Center(
                          child: Text(
                            'Snacks',
                            style: TextStyle(
                                color: snacks ? Colors.white : Colors.green),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: snacks
                                ? Colors.green
                                : Colors.green.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(
                child: FirebaseAnimatedList(
                  query: FirebaseDatabase.instance
                      .ref('Products')
                      .child(widget.cafe == "Doom"
                          ? "DoomCafe"
                          : widget.cafe == "Adab"
                              ? "AdabCafe"
                              : "TemreCafe"),
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    Map<String, dynamic> data =
                        jsonDecode(jsonEncode(snapshot.value));
                    print(data['category']);
                    if (category == data['category']) {
                      return InkWell(
                        onTap: () {
                          final myData = {
                            "image": data['image'],
                            "price": data['price'],
                            "name": data['name'],
                            "count": 1,
                          };
                          FirebaseDatabase.instance
                              .ref('Cart')
                              .child(widget.cafe == "Doom"
                                  ? "DoomCafe"
                                  : widget.cafe == "Adab"
                                      ? "AdabCafe"
                                      : "TemreCafe")
                              .child(FirebaseAuth.instance.currentUser!.uid)
                              .push()
                              .set(myData);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xffcbd8c8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 22,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Colors.grey[200]),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(22.0),
                                          child: Image.network(
                                            data['image'],
                                            fit: BoxFit.fill,
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent?
                                                        loadingProgress) {
                                              if (loadingProgress == null)
                                                return child;
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes!
                                                      : null,
                                                ),
                                              );
                                            },
                                          ),
                                        )),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 32,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data['name'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Schyler'),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      data['price'].toString() + " \$",
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Schyler'),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color:Colors.blueGrey.withOpacity(0.7)),
                                child: const InkWell(
                                  child: Center(
                                    child: Icon(
                                      Icons.add_shopping_cart_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 22,
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
