import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  static const routename = '/Services';
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: Text('Services'),
    );
  }
}