import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/productsmodel.dart';

class ProductDataSource {
  final String baseUrl;

  ProductDataSource({required this.baseUrl});

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      return productsFromJson(response.body); // From product_model.dart
    } else {
      throw Exception('Failed to load products: ${response.statusCode}');
    }
  }

  Future<Product> fetchProductById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/products/$id'));

    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load product: ${response.statusCode}');
    }
  }
}
