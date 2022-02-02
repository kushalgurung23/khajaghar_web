import 'package:flutter/cupertino.dart';
import 'package:flutter_web/models/order_model.dart';

class OrderListController extends ChangeNotifier {
  List<OrderModel> _orderModel = [];
  List<OrderModel> get orderList => List.from(_orderModel);

  List<OrderModel> getOrderList() {
    List<OrderModel> orderModel = [
      OrderModel(
          imageLocation: "assets/images/french_fries.png",
          itemName: "French Fries",
          quantity: 2,
          unitPrice: 129,
          offerPrice: 0,
          total: 258,
          cookingAdvice: []),
      OrderModel(
          imageLocation: "assets/images/chicken_momo.png",
          itemName: "Chicken Mo:Mo",
          quantity: 10,
          unitPrice: 129,
          offerPrice: 0,
          total: 1290,
          cookingAdvice: ['Mo:Mo (4 piece)', 'Chutni', 'Mo:Mo (4 piece)']),
      OrderModel(
          imageLocation: "assets/images/black_forest.png",
          itemName: "Black Forest",
          quantity: 4,
          unitPrice: 129,
          offerPrice: 0,
          total: 516,
          cookingAdvice: []),
      OrderModel(
          imageLocation: "assets/images/chicken_momo.png",
          itemName: "Chicken Mo:Mo",
          quantity: 10,
          unitPrice: 129,
          offerPrice: 0,
          total: 1290,
          cookingAdvice: ['Mo:Mo (4 piece)', 'Chutni', 'Mo:Mo (4 piece)']),
      OrderModel(
          imageLocation: "assets/images/chicken_momo.png",
          itemName: "Chicken Mo:Mo",
          quantity: 10,
          unitPrice: 129,
          offerPrice: 0,
          total: 1290,
          cookingAdvice: ['Mo:Mo (4 piece)', 'Chutni', 'Mo:Mo (4 piece)']),
    ];
    _orderModel = orderModel;
    return orderModel;
  }

  double get rowHeight {
    int rowHeight = 40;
    int cookingAdviceCount = 0;
    for (int i = 0; i < orderList.length; i++) {
      if (orderList[i].cookingAdvice != null) {
        if (orderList[i].cookingAdvice!.length > cookingAdviceCount) {
          cookingAdviceCount = orderList[i].cookingAdvice!.length;
        }
      }
    }
    // 40 = height that can adjust two lines
    return rowHeight + (cookingAdviceCount * 40);
  }

  void changeQuantity(
      {required bool increase, required OrderModel orderModel}) {
    // Increase quantity
    if (increase) {
      if (orderModel.quantity >= 1 && orderModel.quantity <= 98) {
        orderModel.quantity++;
        orderModel.total = (orderModel.unitPrice * orderModel.quantity) -
            orderModel.offerPrice;
      }
    }
    // Decrease quantity
    else {
      if (orderModel.quantity >= 2) {
        orderModel.quantity--;
        orderModel.total = (orderModel.unitPrice * orderModel.quantity) -
            orderModel.offerPrice;
      }
    }
    notifyListeners();
  }
}
