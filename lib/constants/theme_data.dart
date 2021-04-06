import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData = ThemeData(
  primaryColor: Colors.white,
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
    ),
    bodyText2: GoogleFonts.montserrat(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    subtitle1: GoogleFonts.montserrat(
      fontSize: 24.0,
      color: Colors.white,
      letterSpacing: 2.4,
    ),
    subtitle2: GoogleFonts.montserrat(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.auto,

    // focusedBorder: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(10.0),
    //   borderSide: BorderSide(
    //     // color: ColorsTheme.mainPageIconColor,
    //     width: 2.0,
    //   ),
    // ),
    // enabledBorder: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(10.0),
    //   borderSide: BorderSide(
    //     // color: ColorsTheme.mainPageIconColor,
    //     width: 2.0,
    //   ),
    // ),
  ),
);
