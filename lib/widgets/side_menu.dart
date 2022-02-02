import 'package:flutter/material.dart';
import 'package:flutter_web/constants/style.dart';
import 'package:flutter_web/controllers/menu_controller.dart';
import 'package:flutter_web/controllers/navigation_controller.dart';
import 'package:flutter_web/helpers/responsiveness.dart';
import 'package:flutter_web/routing/routes.dart';
import 'package:flutter_web/widgets/custom_text.dart';
import 'package:flutter_web/widgets/side_menu_item.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Consumer<MenuController>(builder: (context, data, child) {
      return Container(
        color: kLight,
        child: ListView(
          children: [
            if (ResponsiveWidget.isSmallScreen(context))
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      SizedBox(width: _width / 48),
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Image.asset("assets/icons/logo.png"),
                      ),
                      const Flexible(
                        child: CustomText(
                          text: "Khaja",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kActive,
                        ),
                      ),
                      SizedBox(width: _width / 48),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            Divider(
              color: kLightGrey.withOpacity(.1),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: sideMenuItems
                  .map((itemName) => SideMenuItem(
                      itemName: itemName,
                      onTap: () {
                        if (!data.isActive(itemName)) {
                          data.changeActiveItemTo(itemName);
                          if (ResponsiveWidget.isSmallScreen(context)) {
                            Navigator.pop(context);
                          }
                          Provider.of<NavigationController>(context,
                                  listen: false)
                              .navigateTo(itemName);
                        }
                      }))
                  .toList(),
            )
          ],
        ),
      );
    });
  }
}
