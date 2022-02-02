import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

List<ProductElement> productElementFromJson(String str) {
  return List<ProductElement>.from(
      json.decode(str).map((x) => ProductElement.fromJson(x)));
}

class Product {
  Product({
    required this.status,
    required this.data,
  });

  String status;
  Data data;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.products,
  });

  List<ProductElement> products;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        products: List<ProductElement>.from(
            json["products"].map((x) => ProductElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class ProductElement {
  ProductElement({
    required this.isVeg,
    required this.usesOfferPrice,
    required this.addons,
    required this.categories,
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.usesStocks,
    required this.orderedCount,
  });

  bool isVeg;
  bool usesOfferPrice;
  List<String> addons;
  List<String> categories;
  String id;
  String name;
  double price;
  String? image;
  String? description;
  bool usesStocks;
  int orderedCount;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        isVeg: json["isVeg"],
        usesOfferPrice: json["usesOfferPrice"],
        addons: List<String>.from(json["addons"].map((x) => x)),
        categories: List<String>.from(json["categories"].map((x) => x)),
        id: json["_id"].toString(),
        name: json["name"].toString(),
        price: json["price"].toDouble(),
        image: json["image"],
        description: json["description"].toString(),
        usesStocks: json["usesStocks"],
        orderedCount: json["orderedCount"],
      );

  Map<String, dynamic> toJson() => {
        "isVeg": isVeg,
        "usesOfferPrice": usesOfferPrice,
        "addons": List<dynamic>.from(addons.map((x) => x)),
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "_id": id,
        "name": name,
        "price": price,
        "image": image,
        "description": description,
        "usesStocks": usesStocks,
        "orderedCount": orderedCount,
      };
}
