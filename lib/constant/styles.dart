import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

abstract class StyleConstant {
  //font size
  static BuildContext mainContext;
  static double screenWidth;
  static double screenHeight;

  static registerContext(BuildContext context) {
    print("registerContext");
    mainContext = context;
    screenWidth = MediaQuery.of(mainContext).size.width;
    screenWidth = MediaQuery.of(mainContext).size.height;
  }

  static double h1FontSize = screenWidth > 1700
      ? ResponsiveFlutter.of(mainContext).moderateScale(280)
      : ResponsiveFlutter.of(mainContext).moderateScale(80, 0.1);

  static double h2FontSize = screenWidth > 1700
      ? ResponsiveFlutter.of(mainContext).moderateScale(250)
      : ResponsiveFlutter.of(mainContext).moderateScale(25, 0.1);

  static const double h3FontSize = 22.0;
  static const double mediumFontSize = 35.0;
  static const double mainFooterFont = 16.0;
  static const double textFooterFont = 14.0;

  static const Color backgroundColor = Color(0xfffed8b1);
  static const Color footerColor = Color(0xffa5a355);
  static const Color kuizBackgroundColor = Color(0xffCD853F);
  static const Color wrongColorCode = Color(0xffDC143C);
  //font style
  static TextStyle h1TextStyle =
      TextStyle(fontSize: h1FontSize, fontFamily: 'Header', color: footerColor);

  static TextStyle h2TextStyle =
      TextStyle(fontSize: h2FontSize, fontFamily: 'Roboto-Bold');

  static const TextStyle h3TextStyle =
      TextStyle(fontSize: h3FontSize, fontFamily: 'Roboto-Bold');

  static const TextStyle mediumFontStyle =
      TextStyle(fontSize: mediumFontSize, fontFamily: 'Roboto-Bold');

  static const TextStyle mediumFontStyle_ColorTheme = TextStyle(
      fontSize: mediumFontSize,
      fontFamily: 'Roboto-Bold',
      color: backgroundColor);

  static const TextStyle buttonTextStyle =
      TextStyle(fontSize: 28, color: Colors.black, fontWeight: FontWeight.bold);

  static const TextStyle button_2_TextStyle =
      TextStyle(fontSize: 16, color: Colors.black);

  static ButtonStyle globalButtonStyle = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.black, width: 3.0))),
    overlayColor:
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.focused)) return Colors.grey;
      return Colors.black12; // Defer to the widget's default.
    }),
  );

  static ButtonStyle seconddaryButtonStyle = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.black, width: 2.0))),
    overlayColor:
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.focused)) return Colors.grey;
      return Colors.black12; // Defer to the widget's default.
    }),
  );

  static const IconData arrow_back = IconData(0xf359,
      fontFamily: 'FontAwesomeSolid', fontPackage: 'font_awesome_flutter');
}
