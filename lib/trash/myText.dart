import 'package:flutter/material.dart';

class mytext extends StatelessWidget {
  final String? hint;
  final bool? paswword;
  final TextStyle? Style;

  const mytext({Key? key, this.hint, this.paswword, this.Style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String id = '';
    String Password = '';
    return TextField(
      obscureText: paswword == null ? false : true,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: Style,
          filled: true,
          fillColor: Colors.white70,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(color: Colors.black))),
    );
  }
}
