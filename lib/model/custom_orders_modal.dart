import 'dart:convert';

CustomOrderListModal customOrderListModalFromJson(String str) => CustomOrderListModal.fromJson(json.decode(str));

String customOrderListModalToJson(CustomOrderListModal data) => json.encode(data.toJson());

class CustomOrderListModal {
  List<CustomOrder> data;
  String message;
  bool status;

  CustomOrderListModal({
    required this.data,
    required this.message,
    required this.status,
  });

  factory CustomOrderListModal.fromJson(Map<String, dynamic> json) => CustomOrderListModal(
    data: List<CustomOrder>.from(json["data"].map((x) => CustomOrder.fromJson(x))),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
    "status": status,
  };
}

class CustomOrder {
  int id;
  int userId;
  String orderId;
  List<String> images;
  String description;
  String status;
  DateTime deliveredAt;
  DateTime createdAt;
  DateTime updatedAt;
  String companyName;
  String shippingAddress;

  CustomOrder({
    required this.id,
    required this.userId,
    required this.orderId,
    required this.images,
    required this.description,
    required this.status,
    required this.deliveredAt,
    required this.createdAt,
    required this.updatedAt,
    required this.companyName,
    required this.shippingAddress,
  });

  factory CustomOrder.fromJson(Map<String, dynamic> json) => CustomOrder(
    id: json["id"],
    userId: json["user_id"],
    orderId: json["order_id"],
    images: List<String>.from(json["images"].map((x) => x)),
    description: json["description"],
    status: json["status"],
    deliveredAt: DateTime.parse(json["delivred_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    companyName: json["company_name"],
    shippingAddress: json["shipping_address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "order_id": orderId,
    "images": List<dynamic>.from(images.map((x) => x)),
    "description": description,
    "status": status,
    "delivred_at": deliveredAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "company_name": companyName,
    "shipping_address": shippingAddress,
  };
}