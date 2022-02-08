import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_web/helpers/responsiveness.dart';
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

  void changeSelectedValue({required String newValue}) {
    selectedValue = newValue;
    notifyListeners();
  }

  double getSizedBoxHeight(BuildContext context) {
    try {
      if(ResponsiveWidget.isSmallScreen(context)) {
        return 220;
      }
      else if(ResponsiveWidget.isCustomScreen(context) || ResponsiveWidget.isMediumScreen(context)) {
        return 260;
      }
      else {
        return 370;
      }
    }
    finally{
      notifyListeners();
    }
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
