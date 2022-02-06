import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web/constants/style.dart';
import 'package:flutter_web/controllers/order_list_controller.dart';
import 'package:flutter_web/helpers/responsiveness.dart';
import 'package:flutter_web/helpers/size_configuration.dart';
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
                : Flexible(
                    child: SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  Colors.green,
                                  Colors.greenAccent,
                                  Colors.lightGreenAccent
                                ]),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Customer Details",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("Phone: " +
                                    data.order!.data.order.deliveryAddress
                                        .phone),
                                Text("Email: " +
                                    data.order!.data.order.deliveryAddress
                                        .email),
                                Text("Address: " +
                                    data.order!.data.order.deliveryAddress
                                        .address),
                              ],
                            ),
                          ),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data.order!.data.order.items.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: ResponsiveWidget.isSmallScreen(
                                                  context) ||
                                              ResponsiveWidget.isCustomScreen(
                                                  context)
                                          ? 100
                                          : 200.0,
                                      right: ResponsiveWidget.isSmallScreen(
                                                  context) ||
                                              ResponsiveWidget.isCustomScreen(
                                                  context)
                                          ? 100
                                          : 200.0,
                                      bottom: 20),
                                  child: SizedBox(
                                    height:
                                        ResponsiveWidget.isSmallScreen(context)
                                            ? 220
                                            : 270,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                ),
                                                image: DecorationImage(
                                                    image: data
                                                            .order!
                                                            .data
                                                            .order
                                                            .items[index]
                                                            .item
                                                            .product
                                                            .image
                                                            .isNotEmpty
                                                        ? NetworkImage(data
                                                            .order!
                                                            .data
                                                            .order
                                                            .items[index]
                                                            .item
                                                            .product
                                                            .image)
                                                        : const NetworkImage(
                                                            "http://www.newdesignfile.com/postpic/2015/02/not-available-icon_68023.jpg"),
                                                    fit: BoxFit.fill)),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(20),
                                                    bottomRight:
                                                        Radius.circular(20),
                                                  ),
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        Colors.green,
                                                        Colors.greenAccent,
                                                        Colors.lightGreenAccent
                                                      ])),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text("Name: " +
                                                      data
                                                          .order!
                                                          .data
                                                          .order
                                                          .items[index]
                                                          .item
                                                          .product
                                                          .name),
                                                  Text("Quantity: " +
                                                      data
                                                          .order!
                                                          .data
                                                          .order
                                                          .items[index]
                                                          .item
                                                          .quantity
                                                          .toString()),
                                                  Text("Unit Price: Rs. " +
                                                      data
                                                          .order!
                                                          .data
                                                          .order
                                                          .items[index]
                                                          .item
                                                          .unitPrice
                                                          .toString()),
                                                  Text("Line Total: Rs. " +
                                                      (data
                                                                  .order!
                                                                  .data
                                                                  .order
                                                                  .items[index]
                                                                  .item
                                                                  .unitPrice *
                                                              data
                                                                  .order!
                                                                  .data
                                                                  .order
                                                                  .items[index]
                                                                  .item
                                                                  .quantity)
                                                          .toString()),
                                                ],
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                );
                              }),
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
