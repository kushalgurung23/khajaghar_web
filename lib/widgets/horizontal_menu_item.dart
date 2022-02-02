import 'package:flutter/material.dart';
import 'package:flutter_web/constants/style.dart';
import 'package:flutter_web/controllers/menu_controller.dart';
import 'package:flutter_web/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;
  const HorizontalMenuItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Consumer<MenuController>(
      builder: (context, data, child) {
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
                  visible: data.isHovering(itemName) || data.isActive(itemName),
                  child: Container(
                    width: 6,
                    height: 40,
                    color: kDark,
                  ),
                  maintainSize: true,
                  maintainState: true,
                  maintainAnimation: true,
                ),
                SizedBox(width: _width / 80),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: data.returnIconFor(itemName),
                ),
                if (!data.isActive(itemName))
                  Flexible(
                      child: CustomText(
                    text: itemName,
                    color: data.isHovering(itemName) ? kDark : kLightGrey,
                  ))
                else
                  Flexible(
                      child: CustomText(
                    text: itemName,
                    color: kDark,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ))
              ],
            ),
          ),
        );
      },
    );
  }
}
