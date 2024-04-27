import 'dart:convert';

NotificationsListModal notificationsListModalFromJson(String str) => NotificationsListModal.fromJson(json.decode(str));

String notificationsListModalToJson(NotificationsListModal data) => json.encode(data.toJson());

class NotificationsListModal {
  List<Notification> data;

  NotificationsListModal({
    required this.data,
  });

  factory NotificationsListModal.fromJson(Map<String, dynamic> json) => NotificationsListModal(
    data: List<Notification>.from(json["data"].map((x) => Notification.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Notification {
  int id;
  int userId;
  String title;
  String message;
  String orderType;
  String orderId;
  DateTime createdAt;

  Notification({
    required this.id,
    required this.userId,
    required this.title,
    required this.message,
    required this.orderType,
    required this.orderId,
    required this.createdAt,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    id: json["id"],
    userId: json["user_id"],
    title: json["title"],
    message: json["message"],
    orderType: json["order_type"],
    orderId: json["order_id"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "title": title,
    "message": message,
    "order_type": orderType,
    "order_id": orderId,
    "created_at": createdAt.toIso8601String(),
  };
}