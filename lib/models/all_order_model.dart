// To parse this JSON data, do
//
//     final allOrder = allOrderFromJson(jsonString);

import 'dart:convert';

AllOrder allOrderFromJson(String str) => AllOrder.fromJson(json.decode(str));

String allOrderToJson(AllOrder data) => json.encode(data.toJson());

class AllOrder {
  AllOrder({
    required this.status,
    required this.data,
  });

  String status;
  Data data;

  factory AllOrder.fromJson(Map<String, dynamic> json) => AllOrder(
        status: json["status"].toString(),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.orders,
  });

  List<Orders> orders;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        orders:
            List<Orders>.from(json["orders"].map((x) => Orders.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
      };
}

class Orders {
  Orders({
    required this.status,
    required this.acceptedAssignment,
    this.archivedAt,
    required this.id,
    required this.invoice,
    required this.statusLog,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.deliveryAddress,
    required this.placedBy,
    required this.assignedBy,
    required this.assignedTo,
  });

  String status;
  bool acceptedAssignment;
  dynamic archivedAt;
  String id;
  String invoice;
  List<StatusLog> statusLog;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String deliveryAddress;
  String placedBy;
  String assignedBy;
  String assignedTo;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        status: json["status"].toString(),
        acceptedAssignment: json["accepted_assignment"],
        archivedAt: json["archivedAt"].toString(),
        id: json["_id"].toString(),
        invoice: json["invoice"].toString(),
        statusLog: List<StatusLog>.from(
            json["status_log"].map((x) => StatusLog.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        deliveryAddress: json["deliveryAddress"].toString(),
        placedBy: json["placed_by"].toString(),
        assignedBy: json["assigned_by"].toString(),
        assignedTo: json["assigned_to"].toString(),
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
        "deliveryAddress": deliveryAddress,
        "placed_by": placedBy,
        "assigned_by": assignedBy,
        "assigned_to": assignedTo,
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
        name: json["name"].toString(),
        id: json["_id"].toString(),
        setBy: json["set_by"].toString(),
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "_id": id,
        "set_by": setBy,
        "timestamp": timestamp.toIso8601String(),
      };
}
