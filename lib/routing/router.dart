import 'package:flutter/material.dart';
import 'package:flutter_web/routing/routes.dart';
import 'package:flutter_web/screens/authentication/authentication.dart';
import 'package:flutter_web/screens/clients/clients.dart';
import 'package:flutter_web/screens/products/products.dart';
import 'package:flutter_web/screens/order_list/order_list.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case kProductPageRoute:
      return _getPageRoute(const Products());
    case kOrderListPageRoute:
      return _getPageRoute(const OrderList());
    case kClientsPageRoute:
      return _getPageRoute(const Clients());
    default:
      return _getPageRoute(const Authentication());
  }
}

PageRoute _getPageRoute(Widget routeName) {
  return MaterialPageRoute(builder: (context) => routeName);
}
