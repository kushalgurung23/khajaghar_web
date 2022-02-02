import 'dart:convert';
import 'package:flutter_web/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  static String urlAddress = "https://api.khajaghar.ml/api/dalle/products";

  static Future<Product> getProduct() async {
    Product product;
    var url = Uri.parse(urlAddress);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var jsonMap = json.decode(jsonData);
      product = Product.fromJson(jsonMap);
      return product;
    } else {
      throw Exception("Products not found.");
    }
  }
}
