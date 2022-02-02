import 'package:flutter/cupertino.dart';

class NavigationController extends ChangeNotifier {
  static final GlobalKey<NavigatorState> navigationKey = GlobalKey();

  Future<dynamic> navigateTo(String routeName) {
    return navigationKey.currentState!.pushNamed(routeName);
  }

  void goBack() {
    return navigationKey.currentState!.pop();
  }
}
