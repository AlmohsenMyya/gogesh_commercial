import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    textTheme: GoogleFonts.cairoTextTheme(),
    iconTheme: const IconThemeData(
      color: secondaryColor,
    ),
    scaffoldBackgroundColor: primaryColor,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: GoogleFonts.cairo(
          fontSize: 14.sp, fontWeight: FontWeight.w700, color: secondaryColor),
      color: primaryColor,
      elevation: 0,
    ),
    datePickerTheme: const DatePickerThemeData(
      dayStyle: TextStyle(color: Colors.white),
      backgroundColor: AppTheme.secondaryColor,
      headerBackgroundColor: AppTheme.secondaryColor,
    ),
    shadowColor: Colors.black,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: secondaryColor),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(fontSize: 16),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      hintStyle: const TextStyle(
        color: Color(0xffcecece),
        fontSize: 14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(width: 1, color: Color(0xffcbcbcb)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(width: 1, color: secondaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(width: 1, color: Color(0xffcbcbcb)),
      ),
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: secondaryColor),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      textStyle: GoogleFonts.cairo(fontSize: 11.sp, color: primaryColor),

      //  const TextStyle(
      //   color: Colors.white,
      //   fontSize: 16,
      // ),
    )),
  );

  static const Color primaryColor = Color(0xffFFFFFF);
  static const Color green = Color(0xff74C6B8);
  static const Color secondaryColor = Color(0xff191A38);

  static const orange = Color(0xffFF7A45);
}
