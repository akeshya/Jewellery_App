import 'dart:convert';

CategoryListModal categoryListModalFromJson(String str) => CategoryListModal.fromJson(json.decode(str));

String categoryListModalToJson(CategoryListModal data) => json.encode(data.toJson());

class CategoryListModal {
  List<Category> data;
  bool status;

  CategoryListModal({
    required this.data,
    required this.status,
  });

  factory CategoryListModal.fromJson(Map<String, dynamic> json) => CategoryListModal(
    data: List<Category>.from(json["data"].map((x) => Category.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
  };
}

class Category {
  int id;
  String cname;
  String image;
  int isDeleted;
  DateTime createdAt;
  DateTime updatedAt;

  Category({
    required this.id,
    required this.cname,
    required this.image,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    cname: json["cname"],
    image: json["image"],
    isDeleted: json["is_deleted"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cname": cname,
    "image": image,
    "is_deleted": isDeleted,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}