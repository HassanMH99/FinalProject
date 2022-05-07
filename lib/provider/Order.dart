import 'dart:convert';

import 'package:finalproject/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;
  OrderItem(
      {required this.id,
      required this.amount,
      required this.products,
      required this.dateTime});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  late String authToken;
  late String userId;
  getData(String authToken, String uId, List<OrderItem> orders) {
    authToken = authToken;
    userId = uId;
    _orders = orders;
    notifyListeners();
  }

  List<OrderItem> get items {
    return [..._orders];
  }

  Future<void> fetchAndSetOrders([bool filterByUser = false]) async {
    final url =
        'https://graduateproject-5ac10-default-rtdb.firebaseio.com/orders/$userId..json?auth=$authToken';
    try {
      final res = await http.get(Uri.parse(url));
      final extractedData = json.decode(res.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }

      final favRes = await http.get(Uri.parse(url));
      final favData = json.decode(favRes.body);
      final List<OrderItem> loadedorders = [];
      extractedData.forEach((orderId, orderData) {
        loadedorders.add(OrderItem(
          id: 'orderId',
          amount: orderData['amount'],
          dateTime: DateTime.parse(orderData['dataTime']),
          products: (orderData['products'] as List<dynamic>)
              .map((item) => CartItem(
                  id: item['id'],
                  name: item['name'],
                  price: item['price'],
                  quantity: item['quantity']))
              .toList(),
        ));
      });
      _orders = loadedorders.reversed.toList();
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> addOrder(List<CartItem> cartproduct, double total) async {
    final url =
        'https://graduateproject-5ac10-default-rtdb.firebaseio.com/orders/$userId.json?auth=$authToken';
    try {
      final timestamp = DateTime.now();
      final res = await http.post(Uri.parse(url),
          body: json.encode({
            'amount': total,
            'dateTime': timestamp.toIso8601String(),
            'products': cartproduct
                .map((cp) => {
                      'id': cp.id,
                      'name': cp.name,
                      'quantity': cp.quantity,
                      'price': cp.price
                    })
                .toList(),
          }));
      _orders.insert(
          0,
          OrderItem(
              id: json.decode(res.body)['name'],
              amount: total,
              products: cartproduct,
              dateTime: timestamp));

      notifyListeners();
    } catch (e) {
      throw e;
    }
  }
}
