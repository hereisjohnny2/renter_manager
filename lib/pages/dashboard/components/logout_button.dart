import 'package:flutter/material.dart';
import 'package:renter_manager/models/user.dart';
import 'package:renter_manager/pages/dashboard/components/logout_dialog.dart';
import 'package:renter_manager/pages/login/form.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key key,
    @required User user,
  })  : _user = user,
        super(key: key);

  final User _user;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color(0xFFEA6565),
      radius: 26.0,
      child: IconButton(
        icon: Icon(Icons.exit_to_app_rounded),
        iconSize: 24.0,
        color: Colors.white,
        onPressed: () async {
          final bool isLogout = await showDialog(
              context: context,
              builder: (boxContext) {
                return LogoutDialog();
              });
          if (isLogout) {
            _user.logOut();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AuthenticationForm(),
              ),
            );
          }
        },
      ),
    );
  }
}
