import 'package:flutter/material.dart';
import 'package:flutter_web/helpers/responsiveness.dart';
import 'package:flutter_web/widgets/horizontal_menu_item.dart';
import 'package:flutter_web/widgets/vertical_menu_item.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;
  const SideMenuItem({Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // customScreen: >= 768 & <= 1100
    return ResponsiveWidget.isCustomScreen(context)
        ? VerticalMenuItem(itemName: itemName, onTap: onTap)
        : HorizontalMenuItem(itemName: itemName, onTap: onTap);
  }
}
