import 'package:finalproject/screens/CafeRoom.dart';
import 'package:finalproject/provider/productdoom.dart';
import 'package:finalproject/provider/cart.dart';
import 'package:finalproject/provider/products.dart';
import 'package:finalproject/provider/Order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum FilterOption { favorate, ALL }

class Doom extends StatefulWidget {
  const Doom({Key? key}) : super(key: key);

  @override
  State<Doom> createState() => _DoomState();
}

class _DoomState extends State<Doom> {
  var _isLoading = false;
  var _showOnlyfavorate = false;
  //var _isInit = false;
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Doom Cafeferia'),
      ),
    ));
  }
}
