import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

final ThemeData appTheme = buildAppTheme();

ThemeData buildAppTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: kPrimaryColor,
    accentColor: kPrimaryColor,
    scaffoldBackgroundColor: kWhite,
    cardColor: kWhite,
    textSelectionColor: kPrimaryColor,
    errorColor: kErrorRed,
    textTheme: buildAppTextTheme(base.textTheme),
    buttonTheme: base.buttonTheme.copyWith(
      textTheme: ButtonTextTheme.normal,
    ),
    appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        textTheme: TextTheme(
            title: GoogleFonts.poppins(fontSize: 25, color: Colors.black))),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      enabledBorder: new OutlineInputBorder(
        borderSide: new BorderSide(color: kPrimaryColor, width: 1),
      ),
      border: new OutlineInputBorder(
        borderSide: new BorderSide(color: kPrimaryColor, width: 1),
      ),
      disabledBorder: new OutlineInputBorder(
        borderSide: new BorderSide(color: kPrimaryColor, width: 1),
      ),
      focusedBorder: new OutlineInputBorder(
        borderSide: new BorderSide(color: kPrimaryColor, width: 1),
      ),
      errorBorder: new OutlineInputBorder(
        borderSide: new BorderSide(color: kErrorRed, width: 1),
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kPrimaryColor,
      ),
    ),
  );
}

TextTheme buildAppTextTheme(TextTheme textTheme) {
  return GoogleFonts.poppinsTextTheme(textTheme).copyWith(
    headline1: GoogleFonts.poppins(textStyle: textTheme.headline1),
    headline2: GoogleFonts.poppins(textStyle: textTheme.headline2),
    headline3: GoogleFonts.poppins(textStyle: textTheme.headline3),
    headline4: GoogleFonts.poppins(textStyle: textTheme.headline4),
    headline5: GoogleFonts.poppins(
        textStyle: textTheme.headline5.copyWith(
            color: kPrimaryColor, fontSize: 24.0, fontWeight: FontWeight.bold)),
    headline6: GoogleFonts.poppins(textStyle: textTheme.headline6),
    bodyText1: GoogleFonts.poppins(textStyle: textTheme.bodyText1),
    bodyText2: GoogleFonts.poppins(
        textStyle: textTheme.bodyText2.copyWith(color: kTextSecondaryColor)),
    subtitle1: GoogleFonts.poppins(textStyle: textTheme.subtitle1),
    subtitle2: GoogleFonts.poppins(textStyle: textTheme.subtitle2),
    button: GoogleFonts.poppins(
        textStyle: textTheme.button.copyWith(color: kWhite)),
    caption: GoogleFonts.poppins(
        textStyle: textTheme.caption.copyWith(color: kTextSecondaryColor)),
    overline: GoogleFonts.poppins(textStyle: textTheme.overline),
  );
}
