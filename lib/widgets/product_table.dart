import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/constants/style.dart';
import 'package:flutter_web/controllers/order_list_controller.dart';
import 'package:flutter_web/controllers/product_controller.dart';
import 'package:flutter_web/widgets/custom_text.dart';
import 'package:flutter_web/widgets/stateful_wrapper.dart';
import 'package:provider/provider.dart';

class ProductTable extends StatelessWidget {
  const ProductTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () {
        Provider.of<ProductController>(context, listen: false).fetchProduct();
        Provider.of<OrderListController>(context, listen: false).setInvoiceList();
      },
      child: Consumer<ProductController>(builder: (context, data, child) {
        return SingleChildScrollView(
          child: Container(
            margin:
                const EdgeInsets.symmetric(vertical: 70, horizontal: 10),
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
                        text: 'Products',
                        color: kLightGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                data.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : DataTable2(
                        dataRowHeight: 200,
                        headingRowColor: MaterialStateProperty.all(
                            kLightGrey.withOpacity(0.5)),
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
                            label: Text('Name'),
                            size: ColumnSize.L,
                          ),
                          DataColumn(
                            label: Text('Type'),
                          ),
                          DataColumn2(
                            label: Text('Description'),
                            numeric: true,
                            size: ColumnSize.M,
                          ),
                          DataColumn(
                            label: Text('Price'),
                          ),
                        ],
                        rows: List<DataRow>.generate(
                            data.product.data.products.length,
                            (index) => DataRow(cells: [
                                  DataCell(data.product.data.products[index]
                                              .image !=
                                          null
                                      ? Image.network(
                                          data.product.data.products[index]
                                              .image!,
                                          width: 140,
                                        )
                                      : Image.asset(
                                          "assets/images/NoImage.png")),
                                  DataCell(Text(data
                                      .product.data.products[index].name)),
                                  DataCell(Text(data.product.data
                                          .products[index].isVeg
                                      ? 'Veg'
                                      : 'Non-Veg')),
                                  DataCell(Center(
                                    child: Text(
                                      data.product.data.products[index]
                                                  .description ==
                                              'null'
                                          ? '-'
                                          : data.product.data
                                              .products[index].description!,
                                      maxLines: 10,
                                      style: TextStyle(
                                          overflow: data
                                                      .product
                                                      .data
                                                      .products[index]
                                                      .description!
                                                      .length >
                                                  225
                                              ? TextOverflow.ellipsis
                                              : null),
                                    ),
                                  )),
                                  DataCell(Text(data
                                      .product.data.products[index].price
                                      .toString())),
                                ]))),
              ],
            ),
          ),
        );
      }),
    );
  }
}
