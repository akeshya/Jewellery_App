import 'dart:convert';

GetSubCategoryModal getSubCategoryModalFromJson(String str) => GetSubCategoryModal.fromJson(json.decode(str));

String getSubCategoryModalToJson(GetSubCategoryModal data) => json.encode(data.toJson());

class GetSubCategoryModal {
  List<SubCategory> data;
  bool status;

  GetSubCategoryModal({
    required this.data,
    required this.status,
  });

  factory GetSubCategoryModal.fromJson(Map<String, dynamic> json) => GetSubCategoryModal(
    data: List<SubCategory>.from(json["data"].map((x) => SubCategory.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
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

  SubCategory({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.image,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: json["id"],
    categoryId: json["category_id"],
    name: json["name"],
    image: json["image"],
    isDeleted: json["is_deleted"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "name": name,
    "image": image,
    "is_deleted": isDeleted,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}