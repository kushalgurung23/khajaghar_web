import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_web/models/order_model.dart';
import 'package:flutter_web/repositories/order_repository.dart';

class OrderListController extends ChangeNotifier {
  Order? order;
  Future<void> setOrder(String invoiceNumber) async {
    try {
      Order awaitedOrder = await OrderRepository.getOrder(invoiceNumber);
      order = awaitedOrder;
    } on Exception catch (e) {
      throw Exception(e);
    } finally {
      notifyListeners();
    }
  }

  String? selectedValue;
  double? sizedBoxHeight;

  void changeSelectedValue({required String newValue}) {
    selectedValue = newValue;
    notifyListeners();
  }

  late List invoiceNumbers;
  void setInvoiceList() async {
    try {
      invoiceNumbers = await OrderRepository.getInvoiceNumber();
    } on Exception catch (e) {
      throw Exception(e);
    } finally {
      notifyListeners();
    }
  }
}
