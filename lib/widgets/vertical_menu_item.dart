import 'package:flutter/material.dart';
import 'package:flutter_web/constants/style.dart';
import 'package:flutter_web/controllers/menu_controller.dart';
import 'package:flutter_web/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class VerticalMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;
  const VerticalMenuItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuController>(builder: (context, data, child) {
      return InkWell(
        onTap: onTap,
        onHover: (value) {
          value ? data.onHover(itemName) : data.onHover("NoHover");
        },
        child: Container(
          color: data.isHovering(itemName)
              ? kLightGrey.withOpacity(0.1)
              : Colors.transparent,
          child: Row(
            children: [
              Visibility(
                visible: data.isActive(itemName) || data.isHovering(itemName),
                child: Container(
                  width: 3,
                  height: 72,
                  color: kDark,
                ),
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: data.returnIconFor(itemName),
                    ),
                    if (!data.isActive(itemName))
                      Flexible(
                        child: CustomText(
                          text: itemName,
                          color: data.isHovering(itemName) ? kDark : kLightGrey,
                        ),
                      )
                    else
                      Flexible(
                          child: CustomText(
                        text: itemName,
                        color: kDark,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ))
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
