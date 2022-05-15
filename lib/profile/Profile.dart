import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  String username = '...';
  String mobile = '...';
  Map<String, dynamic> userData = {};
  String imagePath = '';

  Future<Map<String, dynamic>> getUserData() async {
    database.ref('UsersInfo').child(auth.currentUser!.uid).get().then((value) {
      Map<String, dynamic> data = jsonDecode(jsonEncode(value.value));
      setState(() {
        userData = data;
      });
    });
    return userData;
  }

  File? imageFile;

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      uploadImagetFirebase(pickedFile.path);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('revoked')));
    }
  }

  Future<void> uploadImagetFirebase(String imagePath) async {
    await FirebaseStorage.instance
        .ref(imagePath)
        .putFile(File(imagePath))
        .then((taskSnapshot) {
      print(taskSnapshot.state.name);
      print(taskSnapshot.state);
      FirebaseStorage.instance.ref(imagePath).getDownloadURL().then((value) {
        FirebaseDatabase.instance
            .ref('Users')
            .child(FirebaseAuth.instance.currentUser!.uid)
            .child('image')
            .set(value)
            .then((value) {});
      }).onError((onError, s) {});
    });
  }

  String balance = '0';
  String name = 'Name';
  String UniversityID = 'Name';
  String image = '';
  String id = 'Name';
  String address = 'Name';

  Future<String> getBalance() async {
    FirebaseDatabase.instance
        .ref('Users')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      Map<String, dynamic> data = jsonDecode(jsonEncode(value.value));

      setState(() {
        name = data['name'].toString();
        name = data['name'].toString();
        UniversityID = data['UniversityID'].toString();
        balance = data['Balance'].toString();
        address = data['id'].toString();
      });
    });
    return '';
  }

  @override
  void initState() {
    getImage();
    getBalance();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    final imagelabel = Container(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.green),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Container(
                  height: 22,
                  width: 22,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill, image: AssetImage("images/c.png"))),
                ),
                Container(
                  color: Color.fromARGB(0, 33, 149, 243),
                  child: Center(
                    child: FutureBuilder(
                        future: getBalance(),
                        builder: (con, text) {
                          return Text(
                            balance,
                            style: TextStyle(color: Colors.white),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: width * 0.05,
        ),
        FutureBuilder(
            future: getImage(),
            builder: (context, snapshot) {
              return InkWell(
                onTap: () {
                  _getFromGallery();
                },
                child: image != ""
                    ? Container(
                        height: height * 1 / 5,
                        width: width * 1 / 2,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: NetworkImage(image))),
                      )
                    : Container(
                        height: height * 1 / 5,
                        width: width * 1 / 2,
                        child: Center(
                          child: Icon(
                            Icons.person,
                            color: Colors.green,
                            size: 72,
                          ),
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      ),
              );
            })
      ],
    ));
    final namelabel = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: height * 1 / 20,
          width: width * 1 / 4,
          // color: Color.fromARGB(225, 25, 26, 25),
          decoration: BoxDecoration(
              color: Color.fromARGB(225, 25, 26, 25),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0))),
          child: Center(
            child: Text(
              "Name:",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ),
        Container(
          height: height * 1 / 20,
          width: width * 1 / 1.55,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0))),
          child: Center(
            child: Text(
              name,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          //color: Color.fromARGB(127, 25, 26, 25),
        ),
      ],
    );
    final idlabel = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: height * 1 / 20,
          width: width * 1 / 4,
          //color: Colors.black,
          decoration: BoxDecoration(
              color: Color.fromARGB(225, 25, 26, 25),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0))),
          child: Center(
            child: Text(
              "ID Student:",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ),
        Container(
          height: height * 1 / 20,
          width: width * 1 / 1.55,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0))),
          child: Center(
            child: Text(
              UniversityID,
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          //color: Color.fromARGB(127, 25, 26, 25),
        ),
      ],
    );
    final emaillabel = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: height * 1 / 20,
          width: width * 1 / 4,
          //color: Colors.black,
          decoration: BoxDecoration(
              color: Color.fromARGB(225, 25, 26, 25),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0))),
          child: Center(
            child: Text(
              "Email:",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ),
        Container(
          height: height * 1 / 20,
          width: width * 1 / 1.55,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0))),
          child: Center(
            child: Text(
              FirebaseAuth.instance.currentUser!.email.toString(),
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          //color: Color.fromARGB(127, 25, 26, 25),
        ),
      ],
    );
    final addresslabel = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: height * 1 / 20,
          width: width * 1 / 4,
          // color: Colors.black,
          decoration: BoxDecoration(
              color: Color.fromARGB(225, 25, 26, 25),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0))),
          child: Center(
            child: Text(
              "Address:",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ),
        Container(
          height: height * 1 / 20,
          width: width * 1 / 1.55,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0))),
          child: Center(
            child: Text(
              address,
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          // color: Color.fromARGB(127, 25, 26, 25),
        ),
      ],
    );

    return Scaffold(
      appBar: null,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 13, 78, 0).withOpacity(0.2),
        ),
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              imagelabel,
              SizedBox(
                height: height * 1 / 40,
              ),
              namelabel,
              SizedBox(
                height: height * 1 / 40,
              ),
              idlabel,
              SizedBox(
                height: height * 1 / 40,
              ),
              emaillabel,
              SizedBox(
                height: height * 1 / 40,
              ),
              addresslabel
            ],
          ),
        ),
      ),
    );
  }

  Future<String> getImage() async {
    FirebaseDatabase.instance
        .ref('Users')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child('image')
        .get()
        .then((value) {
      setState(() {
        image = value.value.toString();
      });
    });
    return image;
  }
}
