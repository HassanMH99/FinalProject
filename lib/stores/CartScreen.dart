import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../primary/Home.dart';

class CartScreen extends StatefulWidget {
  CartScreen({required this.store});

  final String store;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double total = 0.0;

  @override
  void initState() {
    print(widget.store);
    getTotal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffcbd8c8),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.green),
          height: 56,
          width: 100,
          padding: EdgeInsets.only(bottom: 10),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: InkWell(
              onTap: () {
                FirebaseDatabase.instance
                    .ref('Users')
                    .child(FirebaseAuth.instance.currentUser!.uid)
                    .child('Balance')
                    .get()
                    .then((value) {
                  double balance = double.parse(value.value.toString());
                  double newBalance = balance - total;
                  print(newBalance);
                  if (newBalance < 0.0) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'You dont have enough credits to complete this transaction.')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Transaction Completed!')));
                    FirebaseDatabase.instance
                        .ref('Users')
                        .child(FirebaseAuth.instance.currentUser!.uid)
                        .child('Balance')
                        .set(newBalance);

                    FirebaseDatabase.instance
                        .ref('Cart')
                        .child(widget.store == "Doom"
                            ? "DoomCafe"
                            : widget.store == "Adab"
                                ? "AdabCafe"
                                : widget.store == "Temre"
                                    ? "TemreCafe"
                                    : 'Book')
                        .child(FirebaseAuth.instance.currentUser!.uid)
                        .get()
                        .then((value) {
                      final data = {
                        "Store": widget.store,
                        "Total": total,
                        "Date": DateTime.now().toString(),
                        "Count": value.children.length
                      };
                      FirebaseDatabase.instance
                          .ref('Cart')
                          .child(widget.store == "Doom"
                              ? "DoomCafe"
                              : widget.store == "Adab"
                                  ? "AdabCafe"
                                  : widget.store == "Temre"
                                      ? "TemreCafe"
                                      : 'Book')
                          .remove();

                      FirebaseDatabase.instance
                          .ref('Transactions')
                          .child(FirebaseAuth.instance.currentUser!.uid)
                          .push()
                          .set(data);
                      Navigator.push(
                          context, MaterialPageRoute(builder: (v) => Home()));
                    });
                  }
                });
              },
              child: Center(
                child: FutureBuilder(
                  future: getTotal(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return Center(
                        child: Text(
                      "Pay " + total.toString() + " BZU",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ));
                  },
                ),
              )),
        ),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.green,
          title: Text(
            "Cart Page",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[],
        ),
        body: Container(
          child: FirebaseAnimatedList(
            query: FirebaseDatabase.instance
                .ref('Cart')
                .child(widget.store == "Doom"
                    ? "DoomCafe"
                    : widget.store == "Adab"
                        ? "AdabCafe"
                        : widget.store == "Temre"
                            ? "TemreCafe"
                            : 'Book')
                .child(FirebaseAuth.instance.currentUser!.uid),
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map<String, dynamic> data =
                  jsonDecode(jsonEncode(snapshot.value));
              return InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(8),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.green.withOpacity(0.2)),
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
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.grey[200]),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(22.0),
                                  child: Image.network(
                                    data['image'],
                                    fit: BoxFit.fill,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
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
                              data['price'].toString() + " BZU",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Schyler'),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          int pricePerPice =
                              (data['price'] / data['count']).round();

                          int newCount =
                              int.parse(data['count'].toString()) - 1;
                          int newPrice = newCount * pricePerPice;

                          if (data['count'] > 1) {
                            FirebaseDatabase.instance
                                .ref('Cart')
                                .child(widget.store == "Doom"
                                    ? "DoomCafe"
                                    : widget.store == "Adab"
                                        ? "AdabCafe"
                                        : widget.store == "Temre"
                                            ? "TemreCafe"
                                            : 'Book')
                                .child(FirebaseAuth.instance.currentUser!.uid
                                    .toString())
                                .child(snapshot.key.toString())
                                .child('count')
                                .set(newCount);
                            FirebaseDatabase.instance
                                .ref('Cart')
                                .child(widget.store == "Doom"
                                    ? "DoomCafe"
                                    : widget.store == "Adab"
                                        ? "AdabCafe"
                                        : widget.store == "Temre"
                                            ? "TemreCafe"
                                            : 'Book')
                                .child(FirebaseAuth.instance.currentUser!.uid
                                    .toString())
                                .child(snapshot.key.toString())
                                .child('price')
                                .set(newPrice);
                          }
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(8, 6, 8, 18),
                              child: Text(
                                '_',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        data['count'].toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      InkWell(
                        onTap: () {
                          int pricePerPice =
                              (double.parse(data['price'].toString()) /
                                      data['count'])
                                  .round();
                          int newCount =
                              int.parse(data['count'].toString()) + 1;
                          int newPrice = newCount * pricePerPice;
                          FirebaseDatabase.instance
                              .ref('Cart')
                              .child(widget.store == "Doom"
                                  ? "DoomCafe"
                                  : widget.store == "Adab"
                                      ? "AdabCafe"
                                      : widget.store == "Temre"
                                          ? "TemreCafe"
                                          : 'Book')
                              .child(FirebaseAuth.instance.currentUser!.uid
                                  .toString())
                              .child(snapshot.key.toString())
                              .child('count')
                              .set(newCount);
                          FirebaseDatabase.instance
                              .ref('Cart')
                              .child(widget.store == "Doom"
                                  ? "DoomCafe"
                                  : widget.store == "Adab"
                                      ? "AdabCafe"
                                      : widget.store == "Temre"
                                          ? "TemreCafe"
                                          : 'Book')
                              .child(FirebaseAuth.instance.currentUser!.uid
                                  .toString())
                              .child(snapshot.key.toString())
                              .child('price')
                              .set(newPrice);
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(8, 12, 8, 12),
                              child: Text(
                                '+',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      InkWell(
                        onTap: () {
                          print(snapshot.ref.path);
                          FirebaseDatabase.instance
                              .ref('Cart')
                              .child(widget.store == "Doom"
                                  ? "DoomCafe"
                                  : widget.store == "Adab"
                                      ? "AdabCafe"
                                      : widget.store == "Temre"
                                          ? "TemreCafe"
                                          : 'Book')
                              .child(FirebaseAuth.instance.currentUser!.uid
                                  .toString())
                              .child(snapshot.key.toString())
                              .remove()
                              .then((value) {
                            if (total == 0) {
                              Navigator.pop(context);
                            }
                          }).onError((error, stackTrace) {
                            print(error);
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.red.withOpacity(1)),
                          child: const InkWell(
                            child: Center(
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
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
        ));
  }

  Future<String> getTotal() async {
    FirebaseDatabase.instance
        .ref('Cart')
        .child(widget.store == "Doom"
            ? "DoomCafe"
            : widget.store == "Adab"
                ? "AdabCafe"
                : widget.store == "Temre"
                    ? "TemreCafe"
                    : 'Book')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .onValue
        .listen((event) {
      total = 0;
      for (final a in event.snapshot.children) {
        if (mounted) {
          setState(() {
            total = total + double.parse(a.child('price').value.toString());
          });
        }
      }
    });
    return int.parse(total.toString()).toString();
  }
}
