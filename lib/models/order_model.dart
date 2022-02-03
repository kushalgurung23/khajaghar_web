import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order({
    required this.status,
    required this.data,
  });

  String status;
  Data data;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
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
    required this.order,
  });

  OrderClass order;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        order: OrderClass.fromJson(json["order"]),
      );

  Map<String, dynamic> toJson() => {
        "order": order.toJson(),
      };
}

class OrderClass {
  OrderClass({
    required this.status,
    required this.acceptedAssignment,
    required this.archivedAt,
    required this.id,
    required this.invoice,
    required this.statusLog,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.deliveryAddress,
    required this.placedBy,
    required this.items,
  });

  String status;
  bool acceptedAssignment;
  dynamic archivedAt;
  String id;
  int invoice;
  List<StatusLog> statusLog;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  DeliveryAddress deliveryAddress;
  String placedBy;
  List<ItemElement> items;

  factory OrderClass.fromJson(Map<String, dynamic> json) => OrderClass(
        status: json["status"],
        acceptedAssignment: json["accepted_assignment"],
        archivedAt: json["archivedAt"],
        id: json["_id"],
        invoice: json["invoice"],
        statusLog: List<StatusLog>.from(
            json["status_log"].map((x) => StatusLog.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        deliveryAddress: DeliveryAddress.fromJson(json["deliveryAddress"]),
        placedBy: json["placed_by"],
        items: List<ItemElement>.from(
            json["items"].map((x) => ItemElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "accepted_assignment": acceptedAssignment,
        "archivedAt": archivedAt,
        "_id": id,
        "invoice": invoice,
        "status_log": List<dynamic>.from(statusLog.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "deliveryAddress": deliveryAddress.toJson(),
        "placed_by": placedBy,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class DeliveryAddress {
  DeliveryAddress({
    required this.id,
    required this.user,
    required this.phone,
    required this.email,
    required this.address,
    required this.v,
  });

  String id;
  String user;
  String phone;
  String email;
  String address;
  int v;

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) =>
      DeliveryAddress(
        id: json["_id"],
        user: json["user"],
        phone: json["phone"],
        email: json["email"],
        address: json["address"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "phone": phone,
        "email": email,
        "address": address,
        "__v": v,
      };
}

class ItemElement {
  ItemElement({
    required this.item,
    required this.cooked,
    required this.id,
    required this.addons,
    required this.order,
    required this.v,
  });

  ItemItem item;
  bool cooked;
  String id;
  List<dynamic> addons;
  String order;
  int v;

  factory ItemElement.fromJson(Map<String, dynamic> json) => ItemElement(
        item: ItemItem.fromJson(json["item"]),
        cooked: json["cooked"],
        id: json["_id"],
        addons: List<dynamic>.from(json["addons"].map((x) => x)),
        order: json["order"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "item": item.toJson(),
        "cooked": cooked,
        "_id": id,
        "addons": List<dynamic>.from(addons.map((x) => x)),
        "order": order,
        "__v": v,
      };
}

class ItemItem {
  ItemItem({
    required this.quantity,
    required this.product,
    required this.unitPrice,
  });

  int quantity;
  Product product;
  int unitPrice;

  factory ItemItem.fromJson(Map<String, dynamic> json) => ItemItem(
        quantity: json["quantity"],
        product: Product.fromJson(json["product"]),
        unitPrice: json["unitPrice"],
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "product": product.toJson(),
        "unitPrice": unitPrice,
      };
}

class Product {
  Product({
    required this.usesOfferPrice,
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  bool usesOfferPrice;
  String id;
  String name;
  int price;
  String image;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        usesOfferPrice: json["usesOfferPrice"],
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "usesOfferPrice": usesOfferPrice,
        "_id": id,
        "name": name,
        "price": price,
        "image": image,
      };
}

class StatusLog {
  StatusLog({
    required this.name,
    required this.id,
    required this.setBy,
    required this.timestamp,
  });

  String name;
  String id;
  String setBy;
  DateTime timestamp;

  factory StatusLog.fromJson(Map<String, dynamic> json) => StatusLog(
        name: json["name"],
        id: json["_id"],
        setBy: json["set_by"],
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "_id": id,
        "set_by": setBy,
        "timestamp": timestamp.toIso8601String(),
      };
}
