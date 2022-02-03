class TestOrderModel {
  final String imageLocation, itemName;
  final int unitPrice, offerPrice;
  int quantity, total;
  final List<String>? cookingAdvice;

  TestOrderModel(
      {required this.imageLocation,
      required this.itemName,
      required this.quantity,
      required this.unitPrice,
      required this.offerPrice,
      required this.total,
      required this.cookingAdvice});
}
