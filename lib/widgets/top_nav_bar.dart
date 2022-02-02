import 'package:flutter/material.dart';
import 'package:flutter_web/constants/style.dart';
import 'package:flutter_web/helpers/responsiveness.dart';
import 'package:flutter_web/widgets/custom_text.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) {
  return AppBar(
    elevation: 0.0,
    iconTheme: const IconThemeData(color: kDark),
    backgroundColor: kLight,
    leading: !ResponsiveWidget.isSmallScreen(context)
        ? Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 14.0),
                child: Image.asset("assets/icons/logo.png"),
              )
            ],
          )
        : IconButton(
            onPressed: () {
              key.currentState?.openDrawer();
            },
            icon: const Icon(Icons.menu)),
    title: Row(
      children: [
        const Visibility(
            child: CustomText(
          text: "Khaja",
          color: kLightGrey,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        )),
        Expanded(child: Container()),
        IconButton(
            splashRadius: 20,
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: kDark.withOpacity(.7),
            )),
        Stack(
          children: [
            IconButton(
                splashRadius: 20,
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: kDark.withOpacity(0.7),
                )),
            Positioned(
                top: 7,
                right: 7,
                child: Container(
                  width: 12,
                  height: 12,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: kActive,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: kLight, width: 2)),
                ))
          ],
        ),
        const SizedBox(
          width: 12,
        ),
        Container(
          width: 1,
          height: 22,
          color: kLightGrey,
        ),
        const SizedBox(
          width: 12,
        ),
        const CustomText(text: 'Kushal Gurung', color: kLightGrey),
        Container(
          height: 40,
          width: 40,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(2),
            child: const CircleAvatar(
              backgroundColor: kLight,
              child: Icon(
                Icons.person_outline,
                color: kDark,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
