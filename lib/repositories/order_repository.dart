import 'dart:convert';
import 'package:flutter_web/models/all_order_model.dart';
import 'package:flutter_web/models/order_model.dart';
import 'package:http/http.dart' as http;

class OrderRepository {
  static String urlAddress = "https://api.khajaghar.ml/api/dalle/orders";

  static Future<Order> getOrder(String invoiceNumber) async {
    Order order;
    var url = Uri.parse('$urlAddress/$invoiceNumber');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var jsonMap = json.decode(jsonData);
      order = Order.fromJson(jsonMap);
      return order;
    } else {
      throw Exception("Order not found.");
    }
  }

  static Future<List> getInvoiceNumber() async {
    AllOrder allOrder;
    List invoiceNumbers = <String>[];
    var url = Uri.parse(urlAddress);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var jsonMap = json.decode(jsonData);
      allOrder = AllOrder.fromJson(jsonMap);
      for (int i = 0; i < allOrder.data.orders.length; i++) {
        if (allOrder.data.orders[i].status == 'delivered') {
          String invoiceNumber = allOrder.data.orders[i].invoice.toString();
          invoiceNumbers.add(invoiceNumber);
        }
      }
      return invoiceNumbers;
    } else {
      throw Exception("Order not found.");
    }
  }
}
