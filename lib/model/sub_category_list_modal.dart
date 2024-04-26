import 'dart:convert';

SubCategoryListModal subCategoryListModalFromJson(String str) => SubCategoryListModal.fromJson(json.decode(str));

String subCategoryListModalToJson(SubCategoryListModal data) => json.encode(data.toJson());

class SubCategoryListModal {
  List<SubCategory> data;

  SubCategoryListModal({
    required this.data,
  });

  factory SubCategoryListModal.fromJson(Map<String, dynamic> json) => SubCategoryListModal(
    data: List<SubCategory>.from(json["data"].map((x) => SubCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class SubCategory {
  int id;
  int categoryId;
  String name;
  String image;
  int isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  String cname;

  SubCategory({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.image,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.cname,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: json["id"],
    categoryId: json["category_id"],
    name: json["name"],
    image: json["image"],
    isDeleted: json["is_deleted"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    cname: json["cname"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "name": name,
    "image": image,
    "is_deleted": isDeleted,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "cname": cname,
  };
}