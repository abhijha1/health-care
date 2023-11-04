
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants{
static MediaQueryData? mediaQueryData;
static double? screenWidth;
static double? screenHeight;

void init(BuildContext context)
{
  mediaQueryData = MediaQuery.of(context);
  screenWidth = mediaQueryData!.size.width;
  screenHeight = mediaQueryData!.size.height;
}
static get widthSize {
  return screenWidth;
}
static get heightSize {
  return screenHeight;
}

static String appName = "Health Care";

static Color primaryColor = Colors.white;
static Color secondaryColor = Color(0xFF3B72FF);

 static Color grey = Color(0xff707070);
  static Color textPrimary = Color(0xFF486581);
  static Color textDark = Color(0xFF102A43);

  static Color backgroundColor = Color(0xFFF5F5F7);

  // Green
  static Color darkGreen = Color(0xFF3ABD6F);
  static Color lightGreen = Color(0xFFA1ECBF);

  // Yellow
  static Color darkYellow = Color(0xFF3ABD6F);
  static Color lightYellow = Color(0xFFFFDA7A);

  // Blue
  static Color darkBlue = Color(0xFF3B72FF);
  static Color lightBlue = Color(0xFF3EC6FF);

  // Orange
  static Color darkOrange = Color(0xFFFFB74D);

  static ThemeData lighTheme(BuildContext context)
  {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor: backgroundColor,
      ),
      iconTheme: IconThemeData(
        color: secondaryColor,
      ),
      textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme).apply(
        bodyColor: textDark,)
    );
   


  }
   static double headerHeight = 228.5;
  static double paddingSide = 20.0;
}