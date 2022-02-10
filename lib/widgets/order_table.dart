import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
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
                : Flexible(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Customer Details",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                  "Phone: " +
                                      data.order!.data.order.deliveryAddress
                                          .phone,
                                  style: const TextStyle(color: Colors.white)),
                              Text(
                                  "Email: " +
                                      data.order!.data.order.deliveryAddress
                                          .email,
                                  style: const TextStyle(color: Colors.white)),
                              Text(
                                  "Address: " +
                                      data.order!.data.order.deliveryAddress
                                          .address,
                                  style: const TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                        Flexible(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: DataTable2(
                                  dataRowHeight: 200,
                                  headingRowColor: MaterialStateProperty.all(
                                      kLightGrey.withOpacity(0.5)),
                                  headingTextStyle: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  columnSpacing: 12,
                                  horizontalMargin: 0,
                                  minWidth: 600,
                                  columns: const [
                                    DataColumn2(
                                      label: Text(''),
                                      size: ColumnSize.M,
                                    ),
                                    DataColumn2(
                                      label: Text('Name'),
                                      size: ColumnSize.M,
                                    ),
                                    DataColumn2(
                                      label: Text('Quantity'),
                                      numeric: true,
                                      size: ColumnSize.M,
                                    ),
                                    DataColumn2(
                                      label: Text('Unit Price'),
                                      numeric: true,
                                      size: ColumnSize.M,
                                    ),
                                    DataColumn2(
                                      label: Text('Line Total     '),
                                      numeric: true,
                                      size: ColumnSize.M,
                                    ),
                                  ],
                                  rows: List<DataRow>.generate(
                                      data.order!.data.order.items.length,
                                      (index) => DataRow(cells: [
                                            DataCell(
                                              data
                                                      .order!
                                                      .data
                                                      .order
                                                      .items[index]
                                                      .item
                                                      .product
                                                      .image
                                                      .isNotEmpty
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20),
                                                      child: Container(
                                                        height: 100,
                                                        width: 100,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            image: DecorationImage(
                                                                image: NetworkImage(
                                                                    data
                                                                        .order!
                                                                        .data
                                                                        .order
                                                                        .items[
                                                                            index]
                                                                        .item
                                                                        .product
                                                                        .image),
                                                                fit: BoxFit
                                                                    .fill)),
                                                      ),
                                                    )
                                                  : Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20),
                                                      child: Container(
                                                        height: 100,
                                                        width: 100,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            image: const DecorationImage(
                                                                image: AssetImage(
                                                                    "assets/images/NoImage.png"),
                                                                fit: BoxFit
                                                                    .fill)),
                                                      ),
                                                    ),
                                            ),
                                            DataCell(Text(data
                                                .order!
                                                .data
                                                .order
                                                .items[index]
                                                .item
                                                .product
                                                .name)),
                                            DataCell(Text(data.order!.data.order
                                                .items[index].item.quantity
                                                .toString())),
                                            DataCell(
                                              Text(data.order!.data.order
                                                  .items[index].item.unitPrice
                                                  .toString()),
                                            ),
                                            DataCell(Text((data
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
                                                    .toString() +
                                                "     ")),
                                          ]))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        );
      },
    );
  }
}
