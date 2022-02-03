import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/constants/style.dart';
import 'package:flutter_web/routing/routes.dart';

class MenuController extends ChangeNotifier {
  var activeItem = kProductPageRoute;
  var hoverItem = "";

  void changeActiveItemTo(String itemName) {
    activeItem = itemName;
    notifyListeners();
  }

  void onHover(String itemName) {
    // if false
    if (!isActive(itemName)) {
      hoverItem = itemName;
    }
    notifyListeners();
  }

  isActive(String itemName) {
    return (activeItem == itemName);
  }

  isHovering(String itemName) {
    return (hoverItem == itemName);
  }

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case kProductPageRoute:
        return _customIcon(Icons.fastfood, itemName);
      case kTestOrderListPageRoute:
        return _customIcon(CupertinoIcons.bag, itemName);
      case kOrderListPageRoute:
        return _customIcon(Icons.people_alt_outlined, itemName);
      case kAuthenticationPageRoute:
        return _customIcon(Icons.exit_to_app, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, size: 22, color: kDark);
    return Icon(icon, color: isHovering(itemName) ? kDark : kLightGrey);
  }
}
