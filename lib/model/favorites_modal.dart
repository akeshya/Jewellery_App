import 'dart:convert';

FavoriteModal favoriteModalFromJson(String str) => FavoriteModal.fromJson(json.decode(str));

String favoriteModalToJson(FavoriteModal data) => json.encode(data.toJson());

class FavoriteModal {
  List<Favorite> data;

  FavoriteModal({
    required this.data,
  });

  factory FavoriteModal.fromJson(Map<String, dynamic> json) => FavoriteModal(
    data: List<Favorite>.from(json["data"].map((x) => Favorite.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Favorite {
  int productId;

  Favorite({
    required this.productId,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
    productId: json["product_id"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
  };
}