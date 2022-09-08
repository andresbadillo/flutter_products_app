import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:productos_app/models/models.dart';

class ProductsService extends ChangeNotifier {
  final String _baseUrl =
      'flutter-productsapp-78335-default-rtdb.firebaseio.com';

  final List<Product> products = [];
  bool isLoading = true;

  ProductsService() {
    loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'products.json');
    final res = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(res.body);

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });

    isLoading = false;
    notifyListeners();

    return products;
  }
}
