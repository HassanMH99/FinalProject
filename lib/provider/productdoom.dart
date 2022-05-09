/*import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class productdoom with ChangeNotifier {
  late final String id;
  final String name;
  final String price;
  final String imageUrl;
  bool isFvorate;
  productdoom(
      {required this.id,
      required this.name,
      required this.price,
      required this.imageUrl,
      this.isFvorate = false});

  void _setFavValue(bool newValue) {
    isFvorate = newValue;
    notifyListeners();
  }

  Future<void> toggleFAvoriteStatus(String token, String userId) async {
    final oldStatus = isFvorate;
    isFvorate = !isFvorate;
    notifyListeners();
    final url = '';
    try {
      final res = await http.put(Uri.parse(url), body: json.encode(isFvorate));
      if (res.statusCode >= 400) {
        _setFavValue(oldStatus);
      }
    } catch (e) {
      _setFavValue(oldStatus);
    }
  }
}
*/