import 'package:flutter/material.dart';
import 'package:flutter_web/widgets/custom_text.dart';

class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CustomText(
        text: "Authentication page",
        color: Colors.black,
      ),
    );
  }
}
