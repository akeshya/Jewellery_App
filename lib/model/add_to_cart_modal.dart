import 'dart:convert';

AddCartModal addCartModalFromJson(String str) => AddCartModal.fromJson(json.decode(str));

String addCartModalToJson(AddCartModal data) => json.encode(data.toJson());

class AddCartModal {
  String message;
  bool status;

  AddCartModal({
    required this.message,
    required this.status,
  });

  factory AddCartModal.fromJson(Map<String, dynamic> json) => AddCartModal(
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
  };
}