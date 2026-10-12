import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class ApiService {
  static const String productsUrl = 'https://wantapi.com/products.php';
  static const String bannerUrl = 'https://wantapi.com/assets/banner.png';

  // Ürünleri API'den çeker, internet yoksa assets içindeki JSON'u kullanır
  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(productsUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List list = data['data'];
        return list.map((e) => Product.fromJson(e)).toList();
      }
      throw Exception('Ürünler yüklenemedi');
    } catch (e) {
      return loadLocalProducts();
    }
  }

  Future<List<Product>> loadLocalProducts() async {
    final text = await rootBundle.loadString('assets/data/products.json');
    final data = jsonDecode(text);
    final List list = data['data'];
    return list.map((e) => Product.fromJson(e)).toList();
  }
}
