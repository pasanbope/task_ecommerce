import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';

class ProductService with ChangeNotifier {
  List<Product> _products = [];
  List<String> _categories = [];
  bool _isLoading = false;

  List<Product> get products => _products;

  List<String> get categories => _categories;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> fetchProducts() async {
    isLoading = true;
    try {
      var response = await http.get(
          Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        List<dynamic> productList = json.decode(response.body);
        _products = productList.map((data) => Product.fromJson(data)).toList();
      } else {
        throw Exception(
            'Failed to load products with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    } finally {
      isLoading = false;
    }
  }

  Future<void> fetchCategories() async {
    isLoading = true;
    try {
      var response = await http.get(
          Uri.parse('https://fakestoreapi.com/products/categories'));
      if (response.statusCode == 200) {
        _categories = List<String>.from(json.decode(response.body));
        print(_categories.length);
        isLoading = false;
      } else {
        throw Exception('Failed to load categories with status code: ${response
            .statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    } finally {
      isLoading = false;
    }
  }
}