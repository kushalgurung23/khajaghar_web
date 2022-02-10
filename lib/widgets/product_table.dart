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
      onInit: () async {
        await Provider.of<ProductController>(context, listen: false)
            .fetchProduct();
        Provider.of<OrderListController>(context, listen: false)
            .setInvoiceList();
      },
      child: Consumer<ProductController>(builder: (context, data, child) {
        return Container(
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
                      text: 'Products',
                      color: kLightGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              data.product == null
                  ? const Center(
                      child: Padding(
                      padding: EdgeInsets.only(top: 300.0),
                      child: CircularProgressIndicator(),
                    ))
                  : Flexible(
                      child: SingleChildScrollView(
                        child: DataTable2(
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
                                size: ColumnSize.M,
                              ),
                              DataColumn2(
                                label: Text('Type'),
                                size: ColumnSize.M,
                              ),
                              DataColumn2(
                                label: Text('Description'),
                                size: ColumnSize.L,
                              ),
                              DataColumn2(
                                label: Text('Price     '),
                                numeric: true,
                                size: ColumnSize.M,
                              ),
                            ],
                            rows: List<DataRow>.generate(
                                data.product!.data.products.length,
                                (index) => DataRow(cells: [
                                      DataCell(
                                        data.product!.data.products[index]
                                                    .image !=
                                                null
                                            ? Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                child: Container(
                                                  height: 100,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(20),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              data
                                                                  .product!
                                                                  .data
                                                                  .products[
                                                                      index]
                                                                  .image!),
                                                          fit: BoxFit.fill)),
                                                ),
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                child: Container(
                                                  height: 100,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      image: const DecorationImage(
                                                          image: AssetImage(
                                                              "assets/images/NoImage.png"),
                                                          fit: BoxFit.fill)),
                                                ),
                                              ),
                                      ),
                                      DataCell(Text(data
                                          .product!.data.products[index].name)),
                                      DataCell(Text(data.product!.data
                                              .products[index].isVeg
                                          ? 'Veg'
                                          : 'Non-Veg')),
                                      DataCell(Center(
                                        child: Text(
                                          data.product!.data.products[index]
                                                      .description ==
                                                  'null'
                                              ? '-'
                                              : data.product!.data
                                                  .products[index].description!,
                                          maxLines: 10,
                                          style: TextStyle(
                                              overflow: data
                                                          .product!
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
                                          .product!.data.products[index].price
                                          .toString()+"     ")),
                                    ]))),
                      ),
                    ),
            ],
          ),
        );
      }),
    );
  }
}
