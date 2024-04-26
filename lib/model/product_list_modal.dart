import 'dart:convert';
import 'package:shopping_cart/model/search_product_modal.dart';

ProductListModal productListModalFromJson(String str) => ProductListModal.fromJson(json.decode(str));

String productListModalToJson(ProductListModal data) => json.encode(data.toJson());

class ProductListModal {
  List<Product> data;
  bool status;

  ProductListModal({
    required this.data,
    required this.status,
  });

  factory ProductListModal.fromJson(Map<String, dynamic> json) => ProductListModal(
    data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
  };
}

class Product {
  int id;
  String name;
  int catagoryId;
  int subCatagoryId;
  List<String> image;
  String cname;
  String subName;
  List<Productsize> productsize;

  Product({
    required this.id,
    required this.name,
    required this.catagoryId,
    required this.subCatagoryId,
    required this.image,
    required this.cname,
    required this.subName,
    required this.productsize,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    catagoryId: json["catagory_id"],
    subCatagoryId: json["sub_catagory_id"],
    image: List<String>.from(json["image"].map((x) => x)),
    cname: json["cname"],
    subName: json["sub_name"],
    productsize: List<Productsize>.from(json["productsize"].map((x) => Productsize.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "catagory_id": catagoryId,
    "sub_catagory_id": subCatagoryId,
    "image": List<dynamic>.from(image.map((x) => x)),
    "cname": cname,
    "sub_name": subName,
    "productsize": List<dynamic>.from(productsize.map((x) => x.toJson())),
  };
}