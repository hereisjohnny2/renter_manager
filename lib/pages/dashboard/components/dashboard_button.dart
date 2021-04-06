import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardButton extends StatelessWidget {
  const DashboardButton({
    Key key,
    this.icon,
    this.label,
    this.navigateTo,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final Function navigateTo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5.0),
      child: MaterialButton(
        elevation: 0,
        color: Color(0xFFEA6565),
        minWidth: 120,
        height: 90,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
        onPressed: navigateTo,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              icon,
              color: Color(0xFF582B2B),
              size: 33.0,
            ),
            Text(
              label.toUpperCase(),
              style: GoogleFonts.montserrat(
                color: Color(0xFF582B2B),
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
