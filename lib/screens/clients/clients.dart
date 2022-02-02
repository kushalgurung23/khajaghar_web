import 'package:flutter/material.dart';
import 'package:flutter_web/widgets/custom_text.dart';

class Clients extends StatelessWidget {
  const Clients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CustomText(
        text: "Clients page",
        color: Colors.black,
      ),
    );
  }
}
