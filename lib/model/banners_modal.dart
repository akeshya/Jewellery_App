import 'dart:convert';

BannersListModal bannersListModalFromJson(String str) => BannersListModal.fromJson(json.decode(str));

String bannersListModalToJson(BannersListModal data) => json.encode(data.toJson());

class BannersListModal {
  List<Banner> data;

  BannersListModal({
    required this.data,
  });

  factory BannersListModal.fromJson(Map<String, dynamic> json) => BannersListModal(
    data: List<Banner>.from(json["data"].map((x) => Banner.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Banner {
  int id;
  String categoryId;
  String image;
  String cname;

  Banner({
    required this.id,
    required this.categoryId,
    required this.image,
    required this.cname
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["id"],
    categoryId: json["category_id"],
    image: json["image"],
    cname: json["cname"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "image": image,
    "cname": cname
  };
}