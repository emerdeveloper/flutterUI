import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  get theme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Color(0xFF7bbabb),
      primaryColorLight: Color(0XFFFB925C),
      accentColor: Color(0xFF287a84),
      // Define the default font family.
      // fontFamily: 'steady',
      // backgroundColor: Colors.grey,
      //#aecdcf
      //#6cb3b2
      scaffoldBackgroundColor: Color(0xFFF9F9F9),

      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: GoogleFonts.darkerGrotesqueTextTheme(),
      // bottomsheet background transparent
      canvasColor: Colors.transparent,

      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
