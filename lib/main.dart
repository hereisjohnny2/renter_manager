import 'package:renter_manager/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorsTheme {
  static Color mainColor = Color(0xFFFA8A8A);
  static Color mainPageIconColor = Color(0xFF582B2B);
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Renter Manager',
    home: AuthenticationPage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      textTheme: TextTheme(
        headline1: GoogleFonts.montserrat(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        headline2: GoogleFonts.montserrat(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyText1: GoogleFonts.montserrat(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
        bodyText2: GoogleFonts.montserrat(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        subtitle1: GoogleFonts.montserrat(
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        subtitle2: GoogleFonts.montserrat(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: ColorsTheme.mainPageIconColor,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: ColorsTheme.mainPageIconColor,
            width: 2.0,
          ),
        ),
      ),
    ),
  ));
}
