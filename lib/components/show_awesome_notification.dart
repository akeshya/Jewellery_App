// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';
//
// void showAwesomeNotification(String title, String message, String image) {
//   AwesomeNotifications().createNotification(
//       content: NotificationContent(
//           id: 0,
//           channelKey: 'basic_channel',
//           title: title,
//           body: message,
//           locked: Paint.enableDithering,
//           bigPicture: image,
//           largeIcon: 'https://st2.depositphotos.com/4035913/6124/i/450/depositphotos_61243733-stock-illustration-business-company-logo.jpg',
//           notificationLayout: NotificationLayout.BigPicture,
//           payload: {'notificationId': '1234567890'}),
//       actionButtons: [
//         NotificationActionButton(key: 'REDIRECT', label: 'Redirect'),
//         NotificationActionButton(
//             key: 'REPLY',
//             label: 'Reply Message',
//             requireInputText: true,
//             actionType: ActionType.SilentAction),
//         NotificationActionButton(
//             key: 'DISMISS',
//             label: 'Dismiss',
//             actionType: ActionType.DismissAction,
//             isDangerousOption: true)
//       ]
//   );
// }