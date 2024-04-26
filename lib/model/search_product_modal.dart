import 'dart:convert';

SearchProductModal searchProductModalFromJson(String str) => SearchProductModal.fromJson(json.decode(str));

String searchProductModalToJson(SearchProductModal data) => json.encode(data.toJson());

class SearchProductModal {
  List<SearchItem> data;
  bool status;

  SearchProductModal({
    required this.data,
    required this.status,
  });

  factory SearchProductModal.fromJson(Map<String, dynamic> json) => SearchProductModal(
    data: List<SearchItem>.from(json["data"].map((x) => SearchItem.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
  };
}

class SearchItem {
  int id;
  String name;
  String? discription;
  int catagoryId;
  int subCatagoryId;
  List<String> image;
  String? discount;
  String cname;
  List<Productsize> productsize;

  SearchItem({
    required this.id,
    required this.name,
    this.discription,
    required this.catagoryId,
    required this.subCatagoryId,
    required this.image,
    this.discount,
    required this.cname,
    required this.productsize,
  });

  factory SearchItem.fromJson(Map<String, dynamic> json) => SearchItem(
    id: json["id"],
    name: json["name"],
    discription: json["discription"],
    catagoryId: json["catagory_id"],
    subCatagoryId: json["sub_catagory_id"],
    image: List<String>.from(json["image"].map((x) => x)),
    discount: json["discount_id"],
    cname: json["cname"],
    productsize: List<Productsize>.from(json["productsize"].map((x) => Productsize.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "discription": discription,
    "catagory_id": catagoryId,
    "sub_catagory_id": subCatagoryId,
    "image": List<dynamic>.from(image.map((x) => x)),
    "discount_id": discount,
    "cname": cname,
    "productsize": List<dynamic>.from(productsize.map((x) => x.toJson())),
  };
}

class Productsize {
  int productId;
  String size;
  double productWeight;
  int productQuantity;

  Productsize({
    required this.productId,
    required this.size,
    required this.productWeight,
    required this.productQuantity,
  });

  factory Productsize.fromJson(Map<String, dynamic> json) => Productsize(
    productId: json["product_id"],
    size: json["size"],
    productWeight: json["product_weight"].toDouble(),
    productQuantity: json["product_quantity"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "size": size,
    "product_weight": productWeight,
    "product_quantity": productQuantity,
  };
}