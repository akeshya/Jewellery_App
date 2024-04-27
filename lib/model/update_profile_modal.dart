import 'dart:convert';

UpdateProfileModal updateProfileModalFromJson(String str) => UpdateProfileModal.fromJson(json.decode(str));

String updateProfileModalToJson(UpdateProfileModal data) => json.encode(data.toJson());

class UpdateProfileModal {
  Profile data;
  String message;
  bool status;

  UpdateProfileModal({
    required this.data,
    required this.message,
    required this.status,
  });

  factory UpdateProfileModal.fromJson(Map<String, dynamic> json) => UpdateProfileModal(
    data: Profile.fromJson(json["data"]),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
    "status": status,
  };
}

class Profile {
  int id;
  String primaryPhoneNumber;
  String companyName;
  String? branchName;
  String? gstNumber;
  String shippingAddress;
  String? contactPersonName;
  String? email;
  String? additionalPhoneNumber;
  String? userImage;

  Profile({
    required this.id,
    required this.primaryPhoneNumber,
    required this.companyName,
    this.branchName,
    this.gstNumber,
    required this.shippingAddress,
    this.contactPersonName,
    this.email,
    this.additionalPhoneNumber,
    this.userImage,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["id"],
    primaryPhoneNumber: json["primary_phone_number"],
    companyName: json["company_name"],
    branchName: json["branch_name"],
    gstNumber: json["gst_number"],
    shippingAddress: json["shipping_address"],
    contactPersonName: json["contact_person_name"],
    email: json["email"],
    additionalPhoneNumber: json["additional_phone_number"],
    userImage: json["user_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "primary_phone_number": primaryPhoneNumber,
    "company_name": companyName,
    "branch_name": branchName,
    "gst_number": gstNumber,
    "shipping_address": shippingAddress,
    "contact_person_name": contactPersonName,
    "email": email,
    "additional_phone_number": additionalPhoneNumber,
    "user_image": userImage,
  };
}