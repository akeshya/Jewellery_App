import 'dart:convert';

TncListModal tncListModalFromJson(String str) => TncListModal.fromJson(json.decode(str));

String tncListModalToJson(TncListModal data) => json.encode(data.toJson());

class TncListModal {
  List<Tnc> data;
  String updatedAt;
  bool status;

  TncListModal({
    required this.data,
    required this.updatedAt,
    required this.status,
  });

  factory TncListModal.fromJson(Map<String, dynamic> json) => TncListModal(
    data: List<Tnc>.from(json["data"].map((x) => Tnc.fromJson(x))),
    updatedAt: json["updated_at"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "updated_at": updatedAt,
    "status": status,
  };
}

class Tnc {
  int id;
  String heading;
  String subHeading;

  Tnc({
    required this.id,
    required this.heading,
    required this.subHeading,
  });

  factory Tnc.fromJson(Map<String, dynamic> json) => Tnc(
    id: json["id"],
    heading: json["heading"],
    subHeading: json["sub_heading"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "heading": heading,
    "sub_heading": subHeading,
  };
}