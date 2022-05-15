import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'CartScreen.dart';

class BookStore extends StatefulWidget {
  const BookStore({Key? key}) : super(key: key);

  @override
  State<BookStore> createState() => _BookStoreState();
}

class _BookStoreState extends State<BookStore> {
  String count = '0';
  TextEditingController searchText = TextEditingController();
  int length = 0;
  String name = '';

  Future<String> getCartCount() async {
    FirebaseDatabase.instance
        .ref('Cart')
        .child('Book')
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

  bool searchPressed = false;
  GlobalKey<FormState> key = GlobalKey();

  @override
  void dispose() {
    searchText.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    getCartCount();
    super.initState();
  }

  //var _isInit = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                if (count != '0') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (c) => CartScreen(
                            store: 'Book',
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
            'Book Store',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: key,
              child: TextFormField(
                onChanged: (text) {
                  setState(() {
                    length = text.length;
                  });
                },
                controller: searchText,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a book name';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                autofocus: false,
                decoration: InputDecoration(
                  suffixIcon: length > 0
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              name = searchText.text.toString();
                              searchPressed = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.green),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              searchPressed = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.transparent),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: const Icon(
                                Icons.cancel,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                  hintText: 'Search Books',
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                ),
                onSaved: (String? value) {},
              ),
            ),
          ),
          Expanded(
            child: searchPressed
                ? FirebaseAnimatedList(
                    query:
                        FirebaseDatabase.instance.ref('Products').child('Book'),
                    itemBuilder: (BuildContext context, DataSnapshot snapshot,
                        Animation<double> animation, int index) {
                      Map<String, dynamic> data =
                          jsonDecode(jsonEncode(snapshot.value));
                      if (data['name']
                          .toString()
                          .toLowerCase()
                          .contains(name.toLowerCase())) {
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
                                .child('Book')
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
                                color: Colors.grey[200]),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      color: Colors.lightGreen),
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
                  )
                : FirebaseAnimatedList(
                    query:
                        FirebaseDatabase.instance.ref('Products').child('Book'),
                    itemBuilder: (BuildContext context, DataSnapshot snapshot,
                        Animation<double> animation, int index) {
                      Map<String, dynamic> data =
                          jsonDecode(jsonEncode(snapshot.value));
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
                              .child('Book')
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
                              color: Colors.grey[200]),
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
                                    color: Colors.lightGreen),
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
                    },
                  ),
          ),
        ],
      ),
    ));
  }
}
