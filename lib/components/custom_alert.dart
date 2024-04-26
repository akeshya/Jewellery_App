import 'package:flutter/material.dart';

//custom dialog
customAlertDialog(
    BuildContext context,
    String title,
String content,
VoidCallback onConfirmPressed,
VoidCallback? onCancelPressed) {
  print('title is: $title');

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          if (onCancelPressed != null)
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
                if (onCancelPressed != null) onCancelPressed();
              },
            ),
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
              onConfirmPressed();
            },
          ),
        ],
      );
    },
  );
}