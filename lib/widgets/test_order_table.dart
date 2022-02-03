import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/constants/style.dart';
import 'package:flutter_web/controllers/test_order_list_controller.dart';
import 'package:flutter_web/widgets/custom_text.dart';
import 'package:flutter_web/widgets/quantityButton.dart';
import 'package:flutter_web/widgets/stateful_wrapper.dart';
import 'package:provider/provider.dart';

/// Example without a datasource
class TestOrderTable extends StatelessWidget {
  const TestOrderTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () {
        Provider.of<TestOrderListController>(context, listen: false).getOrderList();
      },
      child: Consumer<TestOrderListController>(builder: (context, data, child) {
        return SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 70, horizontal: 10),
            decoration: BoxDecoration(
              color: kLight,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 6),
                    color: kLightGrey.withOpacity(0.1),
                    blurRadius: 12)
              ],
              border: Border.all(color: kLightGrey, width: 0.5),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: const [
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: CustomText(
                        text: 'Order List',
                        color: kLightGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                DataTable2(
                    dataRowHeight: data.rowHeight,
                    headingRowColor:
                        MaterialStateProperty.all(kLightGrey.withOpacity(0.5)),
                    headingTextStyle:
                        const TextStyle(fontWeight: FontWeight.bold),
                    columnSpacing: 12,
                    horizontalMargin: 0,
                    minWidth: 600,
                    columns: const [
                      DataColumn2(
                        label: Text(''),
                        size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('Items'),
                        size: ColumnSize.L,
                      ),
                      DataColumn(
                        label: Text('Quantity'),
                      ),
                      DataColumn2(
                        label: Text('Unit Price'),
                        numeric: true,
                        size: ColumnSize.M,
                      ),
                      DataColumn2(
                          label: Text('Offer Price'),
                          numeric: true,
                          size: ColumnSize.M),
                      DataColumn(
                        label: Text('Total'),
                        numeric: true,
                      ),
                      DataColumn(
                        label: Text('Actions'),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        data.orderList.length,
                        (index) => DataRow(cells: [
                              DataCell(Image.asset(
                                  data.orderList[index].imageLocation)),
                              DataCell(
                                data.orderList[index].cookingAdvice!.isEmpty
                                    ? Text(data.orderList[index].itemName)
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(data.orderList[index].itemName),
                                          Center(
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              padding: EdgeInsets.zero,
                                              itemCount: data.orderList[index]
                                                  .cookingAdvice!.length,
                                              itemBuilder: (context, i) {
                                                return Text(
                                                  '+ ' +
                                                      data.orderList[index]
                                                          .cookingAdvice![i],
                                                  style: const TextStyle(
                                                      color: Colors.red),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                              DataCell(Row(
                                children: [
                                  Flexible(
                                    child: QuantityButton(
                                        onTap: () {
                                          data.changeQuantity(
                                              increase: false,
                                              orderModel:
                                                  data.orderList[index]);
                                        },
                                        icon: const Icon(
                                          Icons.remove,
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                        topLeft: 5,
                                        bottomLeft: 5,
                                        bottomRight: 0,
                                        topRight: 0),
                                  ),
                                  Container(
                                    height: 28,
                                    width: 25,
                                    child: Center(
                                      child: Text(data.orderList[index].quantity
                                          .toString()
                                          .padLeft(2, "0")),
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: kLightGrey)),
                                  ),
                                  Flexible(
                                    child: QuantityButton(
                                        onTap: () {
                                          data.changeQuantity(
                                              increase: true,
                                              orderModel:
                                                  data.orderList[index]);
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                        topLeft: 0,
                                        bottomLeft: 0,
                                        bottomRight: 5,
                                        topRight: 5),
                                  ),
                                ],
                              )),
                              DataCell(Text(
                                  data.orderList[index].unitPrice.toString())),
                              DataCell(data.orderList[index].offerPrice == 0
                                  ? const Text('-')
                                  : Text(data.orderList[index].offerPrice
                                      .toString())),
                              DataCell(
                                  Text(data.orderList[index].total.toString())),
                              DataCell(IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.more_vert),
                              )),
                            ]))),
              ],
            ),
          ),
        );
      }),
    );
  }
}
