import 'dart:convert';
import 'package:flutter_web/models/order_model.dart';
import 'package:http/http.dart' as http;

class OrderRepository {
  static String urlAddress = "https://api.khajaghar.ml/api/dalle/orders";

  static Future<Order> getOrder(int invoiceNumber) async {
    Order order;
    var url = Uri.parse('$urlAddress/$invoiceNumber');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var jsonMap = json.decode(jsonData);
      order = Order.fromJson(jsonMap);
      // print("Order detail of invoice: 1");
      // print(order.data.order.items[0].item.product.name);
      return order;
    } else {
      throw Exception("Order not found.");
    }
  }
}
