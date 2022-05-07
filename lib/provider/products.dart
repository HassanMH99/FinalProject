import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/http_exception.dart';
import 'productdoom.dart';

class products with ChangeNotifier {
  List<productdoom> _items = [
    productdoom(
        id: '1',
        name: 'potato',
        price: '5',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/graduateproject-5ac10.appspot.com/o/potato.jpg?alt=media&token=6b4e4b86-fd27-4ca7-9664-2f7dc5cbd2cb'),
    productdoom(
        id: '2',
        name: 'cola',
        price: '3',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/graduateproject-5ac10.appspot.com/o/cola.jpg?alt=media&token=ec6296a5-235a-44f8-902b-836892726ecc'),
    productdoom(
        id: '3',
        name: 'juce',
        price: '3',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/graduateproject-5ac10.appspot.com/o/juice.jpg?alt=media&token=3a0f981e-adf9-4014-a76b-e853fd402db1'),
    productdoom(
        id: '4',
        name: 'icecoffe',
        price: '5',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/graduateproject-5ac10.appspot.com/o/icecoffe.jpg?alt=media&token=7a10d99b-b8fa-4f41-8991-96e6eb3beab1'),
    productdoom(
        id: '5',
        name: 'finger',
        price: '12',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/graduateproject-5ac10.appspot.com/o/finger.jpg?alt=media&token=b56b115e-aefc-4b27-82fa-a8947f6ed846')
  ];
  late String authToken;
  late String userId;
  getData(String authToken, String uId, List<productdoom> products) {
    authToken = authToken;
    userId = uId;
    _items = products;
    notifyListeners();
  }

  List<productdoom> get items {
    return [..._items];
  }

  List<productdoom> get favoritesItems {
    return _items.where((prodItem) => prodItem.isFvorate).toList();
  }

  productdoom findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> fetchAndSetProducts([bool filterByUser = false]) async {
    final filteredString =
        filterByUser ? 'orderBy="createrId"&equalTo="$userId"' : '';
    var url =
        'https://graduateproject-5ac10-default-rtdb.firebaseio.com/products.json?auth=$authToken&$filteredString';
    try {
      final res = await http.get(Uri.parse(url));
      final extractedData = json.decode(res.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      url =
          'https://graduateproject-5ac10-default-rtdb.firebaseio.com/userFavorites/$userId.json?auth=$authToken';
      final favRes = await http.get(Uri.parse(url));
      final favData = json.decode(favRes.body);
      final List<productdoom> loadedProduct = [];
      extractedData.forEach((prodId, prodData) {
        loadedProduct.add(productdoom(
            id: 'prodId',
            name: prodData['name'],
            price: prodData['price'],
            imageUrl: prodData['imageUrl'],
            isFvorate: favData == null ? false : favData[prodId] ?? false));
      });
      _items = loadedProduct;
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> addProduct(productdoom product1) async {
    final url =
        'https://graduateproject-5ac10-default-rtdb.firebaseio.com/products.json?auth=$authToken';
    try {
      final res = await http.post(Uri.parse(url),
          body: json.encode({
            'id': product1.id,
            'name': product1.name,
            'price': product1.price,
            'imageUrl': product1.imageUrl
          }));
      final newProduct = productdoom(
          id: json.decode(res.body)['name'],
          name: product1.name,
          price: product1.price,
          imageUrl: product1.imageUrl);
      _items.add(newProduct);
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }
}
