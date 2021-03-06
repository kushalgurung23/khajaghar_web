import 'package:flutter/material.dart';
import 'package:flutter_web/helpers/size_configuration.dart';
import 'package:flutter_web/widgets/order_table.dart';

class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const OrderTable();
  }
}
