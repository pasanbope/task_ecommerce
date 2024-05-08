import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';

class ProductService with ChangeNotifier {
  List<Product> _products = [];
  List<String> _categories = [];

  List<Product> get products => _products;
  List<String> get categories => _categories;

  Future<void> fetchProducts() async {
    var response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      List<dynamic> productList = json.decode(response.body);
      _products = productList.map((data) => Product.fromJson(data)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<void> fetchCategories() async {
    var response = await http.get(Uri.parse('https://fakestoreapi.com/products/categories'));
    if (response.statusCode == 200) {
      _categories = List<String>.from(json.decode(response.body));
      notifyListeners();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
