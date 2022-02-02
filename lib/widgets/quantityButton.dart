import 'package:flutter/material.dart';
import 'package:flutter_web/constants/style.dart';

class QuantityButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget icon;
  final double topLeft, bottomLeft, bottomRight, topRight;
  const QuantityButton(
      {Key? key,
      required this.onTap,
      required this.icon,
      required this.topLeft,
      required this.bottomLeft,
      required this.bottomRight,
      required this.topRight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      width: 25,
      child: OutlinedButton(
        onPressed: onTap,
        child: icon,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: kLightGrey.withOpacity(.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeft),
              bottomLeft: Radius.circular(bottomLeft),
              bottomRight: Radius.circular(bottomRight),
              topRight: Radius.circular(topRight),
            ),
          ),
        ),
      ),
    );
  }
}
