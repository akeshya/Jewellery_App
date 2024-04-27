import 'dart:convert';

GetCartModal getCartModalFromJson(String str) => GetCartModal.fromJson(json.decode(str));

String getCartModalToJson(GetCartModal data) => json.encode(data.toJson());

class GetCartModal {
  List<CartItem> data;
  bool status;

  GetCartModal({
    required this.data,
    required this.status,
  });

  factory GetCartModal.fromJson(Map<String, dynamic> json) => GetCartModal(
    data: List<CartItem>.from(json["data"].map((x) => CartItem.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
  };
}

class CartItem {
  int productId;
  int productQuantity;
  String productSize;
  double productWeight;
  int status;
  String name;
  List<String> image;

  CartItem({
    required this.productId,
    required this.productQuantity,
    required this.productSize,
    required this.productWeight,
    required this.status,
    required this.name,
    required this.image,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    productId: json["product_id"],
    productQuantity: json["product_quantity"],
    productSize: json["product_size"],
    productWeight: json["product_weight"].toDouble(),
    status: json["status"],
    name: json["name"],
    image: List<String>.from(json["image"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_quantity": productQuantity,
    "product_size": productSize,
    "product_weight": productWeight,
    "status": status,
    "name": name,
    "image": List<dynamic>.from(image.map((x) => x)),
  };
}