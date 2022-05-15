import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcbd8c8),
        appBar: null,
        body: FirebaseAnimatedList(
          query: FirebaseDatabase.instance
              .ref('Transactions')
              .child(FirebaseAuth.instance.currentUser!.uid),
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map<String, dynamic> data = jsonDecode(jsonEncode(snapshot.value));
            return Container(
              margin: const EdgeInsets.all(8),
              height: 120,
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
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.green),
                            child: Center(
                                child: Text(
                              (index + 1).toString(),
                              style: TextStyle(color: Colors.white),
                            ))),
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
                        Row(
                          children: [
                            Text(
                              "Number of items:  ",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Schyler'),
                            ),
                            Text(
                              data['Count'].toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Schyler'),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              "Store:  ",
                              textAlign: TextAlign.start,
                              style: const TextStyle(fontFamily: 'Schyler'),
                            ),
                            Text(
                              data['Store'].toString(),
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Schyler'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "On: " +
                                          data['Date']
                                              .toString()
                                              .substring(0, 10),
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Schyler'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.green,
                    width: 2,
                    height: double.infinity - 30,
                  ),
                  SizedBox(
                    width: 22,
                  ),
                  Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.green),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: Text(
                          (data['Total'].toString()).toString() + " \$",
                          style: TextStyle(color: Colors.white),
                        ),
                      ))),
                  SizedBox(
                    width: 22,
                  ),
                ],
              ),
            );
          },
        ));
  }
}
