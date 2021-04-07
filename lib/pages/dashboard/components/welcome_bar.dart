import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renter_manager/models/user.dart';
import 'package:renter_manager/pages/dashboard/components/logout_button.dart';

class WelcomeBar extends StatelessWidget {
  final User user;
  final String name;

  const WelcomeBar({Key key, @required this.user, @required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Olá, $name",
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        LogoutButton(user: user),
      ],
    );
  }
}
