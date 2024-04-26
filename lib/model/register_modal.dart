import 'dart:convert';

RegisterModal registerModalFromJson(String str) => RegisterModal.fromJson(json.decode(str));

String registerModalToJson(RegisterModal data) => json.encode(data.toJson());

class RegisterModal {
  String message;
  bool status;

  RegisterModal({
    required this.message,
    required this.status,
  });

  factory RegisterModal.fromJson(Map<String, dynamic> json) => RegisterModal(
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
  };
}