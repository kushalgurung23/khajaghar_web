import 'package:flutter/material.dart';
import 'package:flutter_web/routing/routes.dart';
import 'package:flutter_web/screens/authentication/authentication.dart';
import 'package:flutter_web/screens/order_list/order_list.dart';
import 'package:flutter_web/screens/products/products.dart';
import 'package:flutter_web/screens/test_order_list/test_order_list.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case kProductPageRoute:
      return _getPageRoute(const Products());
    case kTestOrderListPageRoute:
      return _getPageRoute(const TestOrderList());
    case kOrderListPageRoute:
      return _getPageRoute(const OrderList());
    default:
      return _getPageRoute(const Authentication());
  }
}

PageRoute _getPageRoute(Widget routeName) {
  return MaterialPageRoute(builder: (context) => routeName);
}
