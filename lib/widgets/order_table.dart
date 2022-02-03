import 'package:flutter/material.dart';
import 'package:flutter_web/controllers/order_list_controller.dart';
import 'package:provider/provider.dart';

class OrderTable extends StatelessWidget {
  OrderTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderListController>(
      builder: (context, data, child) {
        return Column(
          children: [
            const SizedBox(height: 120),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: DropdownButton(
                        hint: const Text("Select Invoice number"),
                        dropdownColor: Colors.white,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 36.0,
                        isExpanded: true,
                        underline: const SizedBox(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        value: data.selectedValue,
                        onChanged: (newValue) {
                          data.changeSelectedValue(
                              newValue: newValue.toString());
                        },
                        items: data.listItem.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 90,
                  height: 50,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Find',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
              ],
            )
          ],
        );
      },
    );
  }
}
