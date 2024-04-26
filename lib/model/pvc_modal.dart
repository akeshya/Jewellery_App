import 'dart:convert';

PvcListModal pvcListModalFromJson(String str) => PvcListModal.fromJson(json.decode(str));

String pvcListModalToJson(PvcListModal data) => json.encode(data.toJson());

class PvcListModal {
  List<Pvc> data;
  String updatedAt;
  String extra;
  bool status;

  PvcListModal({
    required this.data,
    required this.updatedAt,
    required this.extra,
    required this.status,
  });

  factory PvcListModal.fromJson(Map<String, dynamic> json) => PvcListModal(
    data: List<Pvc>.from(json["data"].map((x) => Pvc.fromJson(x))),
    updatedAt: json["updated_at"],
    extra: json["extra"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "updated_at": updatedAt,
    "extra": extra,
    "status": status,
  };
}

class Pvc {
  int id;
  String description;
  String heading;
  String subHeading;

  Pvc({
    required this.id,
    required this.description,
    required this.heading,
    required this.subHeading,
  });

  factory Pvc.fromJson(Map<String, dynamic> json) => Pvc(
    id: json["id"],
    description: json["description"],
    heading: json["heading"],
    subHeading: json["sub_heading"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "heading": heading,
    "sub_heading": subHeading,
  };
}