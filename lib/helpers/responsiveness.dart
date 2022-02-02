import 'package:flutter/material.dart';

const int largeScreenSize = 1366;
const int mediumScreenSize = 768;
const int smallScreenSize = 360;
const int customScreenSize = 1100;

class ResponsiveWidget extends StatelessWidget {
  final Widget smallScreen;
  final Widget largeScreen;
  final Widget? customScreen;
  final Widget? mediumScreen;

  const ResponsiveWidget(
      {Key? key,
      required this.largeScreen,
      this.mediumScreen,
      required this.smallScreen,
      this.customScreen})
      : super(key: key);

  // < 768
  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < mediumScreenSize;

  // >= 768 && <= 1100
  static bool isCustomScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= mediumScreenSize &&
      MediaQuery.of(context).size.width <= customScreenSize;

  // > 1100 && < 1366
  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > customScreenSize &&
      MediaQuery.of(context).size.width < largeScreenSize;

  // >= 1366
  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeScreenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double _width = constraints.maxWidth;
      // >= 1366
      if (_width >= largeScreenSize) {
        return largeScreen;
      }
      // > 1100 && < 1366
      else if (_width > customScreenSize && _width < largeScreenSize) {
        return mediumScreen ?? largeScreen;
      }
      // >= 768 && <= 1100
      else if (_width >= mediumScreenSize && _width <= customScreenSize) {
        return customScreen ?? largeScreen;
      } else {
        return smallScreen;
      }
    });
  }
}
