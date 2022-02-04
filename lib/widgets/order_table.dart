import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web/constants/style.dart';
import 'package:flutter_web/controllers/order_list_controller.dart';
import 'package:flutter_web/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class OrderTable extends StatelessWidget {
  const OrderTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderListController>(
      builder: (context, data, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 90),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 20.0),
              child: CustomText(
                text: 'Delivered Order List',
                color: kLightGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(width: 20),
                Expanded(
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
                        data.changeSelectedValue(newValue: newValue.toString());
                      },
                      items: data.invoiceNumbers.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text("Invoice number: " + valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 90,
                  height: 50,
                  child: TextButton(
                    onPressed: () async {
                      print("Selected data value is: " +
                          data.selectedValue.toString());
                      await data.setOrder(data.selectedValue.toString());
                    },
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
            ),
            const SizedBox(height: 20),
            data.order == null
                ? const SizedBox()
                : Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20),
                child: Container(
                  width: double.infinity,
                  height: 500,
                  constraints: const BoxConstraints(
                    minHeight: 500,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: kLightGrey),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                    image: NetworkImage(data.order!.data
                                        .order.items[0].item.product.image),
                                    fit: BoxFit.fill)),
                          )),
                      Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                                border: Border.all(color: kLightGrey),
                                color: kLight.withOpacity(0.1)
                            ),
                          )),
                    ],
                  ),
                ),
                  )
          ],
        );
      },
    );
  }
}
