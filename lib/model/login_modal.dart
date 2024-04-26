import 'dart:convert';

LoginModal loginModalFromJson(String str) => LoginModal.fromJson(json.decode(str));

String loginModalToJson(LoginModal data) => json.encode(data.toJson());

class LoginModal {
  dynamic data;
  String message;
  bool status;

  LoginModal({
    required this.data,
    required this.message,
    required this.status,
  });

  factory LoginModal.fromJson(Map<String, dynamic> json) => LoginModal(
    data: json["data"],
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "message": message,
    "status": status,
  };
}