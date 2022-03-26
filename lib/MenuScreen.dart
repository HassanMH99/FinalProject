import 'package:finalproject/Login.dart';
import 'package:finalproject/Profile.dart';
import 'package:finalproject/Transaction.dart';
import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final IconData Icon;
  const MenuItem(this.title, this.Icon);
}

class MenuScreen extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    int _selectedOption = 0;
    final name = 'Mohammad Hassan';
    final email = 'Cride.it1999@gmail.com';
    final image =
        'https://png.pngtree.com/png-clipart/20200701/original/pngtree-computer-hacker-png-image_5418075.jpg';
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Drawer(
          child: Material(
            color: Colors.green,
            child: ListView(
              padding: padding,
              children: <Widget>[
                buildHeader(
                  name: name,
                  email: email,
                  image: image,
                  onClicked: () {},
                ),
                const SizedBox(height: 48),
                buildMenuItem(
                    text: "Profile",
                    icon: Icons.account_circle_outlined,
                    onClicked: () => SelectedItem(context, 0)),
                const SizedBox(height: 16),
                buildMenuItem(
                    text: "Transaction",
                    icon: Icons.transform_outlined,
                    onClicked: () => SelectedItem(context, 1)),
                const SizedBox(height: 16),
                buildMenuItem(
                    text: "Rate Us", icon: Icons.star_border_outlined),
                const SizedBox(height: 16),
                buildMenuItem(text: "Notification", icon: Icons.notifications),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: const Text(
                    'LogOut',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      fixedSize: const Size(200, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ],
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
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
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
  final color = Colors.white;
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
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Transaction()),
      );
      break;
    default:
  }
}
