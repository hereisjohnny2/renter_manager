import 'package:flutter/material.dart';

class AuthAlertDialog extends StatelessWidget {
  const AuthAlertDialog({
    Key key,
    @required String alertMessage,
  })  : _alertMessage = alertMessage,
        super(key: key);

  final String _alertMessage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Oops..."),
      content: Text(_alertMessage),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Ok"),
        ),
      ],
    );
  }
}
