import 'dart:convert';
import 'dart:io';

import 'package:finalproject/logins/Login.dart';
import 'package:finalproject/profile/Profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuItem {
  final String title;
  final IconData Icon;

  const MenuItem(this.title, this.Icon);
}

class MenuScreen extends StatefulWidget {
  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  double rate = 2.5;
  String name = 'Name';
  String id = 'Name';
  String address = 'Name';

  Future<String> getBalance() async {
    FirebaseDatabase.instance
        .ref('Users')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      Map<String, dynamic> data = jsonDecode(jsonEncode(value.value));
      print(data);
      setState(() {
        name = data['name'].toString();
        name = data['name'].toString();
        address = data['id'].toString();
      });
    });
    return '';
  }

  Future<double> getRate() async {
    FirebaseDatabase.instance
        .ref('Rate')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      setState(() {
        if (value.value != null) {
          rate = double.parse(value.value.toString());
        }
      });
    });
    return rate;
  }

  String image =
      'https://png.pngtree.com/png-clipart/20200701/original/pngtree-computer-hacker-png-image_5418075.jpg';

  Future<String> getImage() async {
    FirebaseDatabase.instance
        .ref('Users')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child('image')
        .get()
        .then((value) {
      setState(() {
        image = value.value.toString();
        print('steve1');
      });
    });
    return image;
  }

  @override
  void initState() {
    getImage();
    getBalance();
    super.initState();
  }
  Color black = Color(0xff2e312e);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.green,
          body: Drawer(
            child: Material(
              color: Color(0xffcbd8c8),
              child: ListView(
                padding: padding,
                children: <Widget>[
                  FutureBuilder(
                      future: getBalance(),
                      builder: (co, ntext) {
                        return buildHeader(
                          name: name,
                          email: FirebaseAuth.instance.currentUser!.email
                              .toString(),
                          image: image,
                          onClicked: () {},
                        );
                      }),
                  Divider(color: Color(0xff2e312e),thickness: 1,),

                  buildMenuItem(
                      text: "Rate Us",
                      icon: Icons.star_border_outlined,
                      onClicked: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return FutureBuilder(
                                  future: getRate(),
                                  builder: (context, snapshot) {
                                    return AlertDialog(
                                      title: Text('Rate us'),
                                      content: RatingBar.builder(
                                        glowColor: Colors.green,
                                        initialRating: rate,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        unratedColor:
                                            Colors.amber.withAlpha(50),
                                        itemCount: 5,
                                        itemSize: 25.0,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          setState(() {
                                            rate = rating;
                                          });
                                        },
                                        updateOnDrag: true,
                                      ),
                                      actions: [
                                        InkWell(
                                          onTap: () {
                                            FirebaseDatabase.instance
                                                .ref('Rate')
                                                .child(FirebaseAuth
                                                    .instance.currentUser!.uid)
                                                .set(rate);
                                            Navigator.pop(context);
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text('Rate'),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Cancel'),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            });
                      }),
                  Divider(color: Color(0xff2e312e)),
                  buildMenuItem(
                      text: "Our apps",
                      icon: Icons.dashboard_rounded,
                      onClicked: () {
                        launchUrl(Uri.parse(
                                'https://play.google.com/store/apps/dev?id=8644631253148453975'))
                            .then((value) => null)
                            .onError((error, stackTrace) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Can't open link!")));
                        });
                      }),
                  Divider(color: Color(0xff2e312e)),
                  buildMenuItem(text: "Payments", icon: Icons.credit_card),
                  Divider(color: Color(0xff2e312e)),
                  buildMenuItem(
                      text: "Contact Us",
                      icon: Icons.call,
                      onClicked: () {
                        if (Platform.isAndroid) {
                          // add the [https]
                          launchUrl(Uri.parse(
                              "https://wa.me/+972505456008/?text=}")); // new line
                        } else {
                          launchUrl(Uri.parse(
                              "https://api.whatsapp.com/send?phone=+972505456008=}")); // new line
                        }
                      }),
                  SizedBox(
                    height: 50,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      });
                    },
                    child: Text(
                      'Logout',
                      style: TextStyle(fontSize: 20, color: Color(0xff2e312e)),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        fixedSize: const Size(200, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader(
          {required String name,
          required String email,
          required String image,
          required VoidCallback? onClicked}) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(image),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Color(0xff2e312e)),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Color(0xff2e312e)
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  final color = Color(0xff2e312e);
  final hovercolor = Colors.white70;
  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(
      text,
      style: TextStyle(color: color),
    ),
    onTap: onClicked,
    hoverColor: hovercolor,
  );
}

void SelectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();
  switch (index) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Profile()),
      );

      break;
      // case 1:
      //   // Navigator.push(
      //   //   context,
      //   //   MaterialPageRoute(builder: (context) => Transaction()),
      //   );
      break;
    default:
  }
}
