import 'package:flutter/cupertino.dart';
import 'package:flutter_web/models/order_model.dart';
import 'package:flutter_web/repositories/order_repository.dart';

class OrderListController extends ChangeNotifier {
  late Order order;
  void setOrder(int invoiceNumber) async {
    try {
      Order order = await OrderRepository.getOrder(invoiceNumber);
      this.order = order;
    } on Exception catch (e) {
      throw Exception(e);
    }
    notifyListeners();
  }

  String? selectedValue;
  List listItem = [
    "01 Drum Set",
    "02 Piano",
    "03 Guitar and Ukulele",
    "04 Others"
  ];

  void changeSelectedValue({required String newValue}) {
    selectedValue = newValue;
    notifyListeners();
  }
}
