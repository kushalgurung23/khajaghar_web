import 'package:flutter/cupertino.dart';
import 'package:flutter_web/models/product_model.dart';
import 'package:flutter_web/repositories/product_repository.dart';

class ProductController extends ChangeNotifier {
  Product? product;
  bool isLoading = false;

  Future<void> fetchProduct() async {
    try {
      isLoading = true;
      Product product = await ProductRepository.getProduct();
      this.product = product;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
