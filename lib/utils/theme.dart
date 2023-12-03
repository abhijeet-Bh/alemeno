import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  //color pallet
  static const Color primaryColor = Color(0xff10217D);
  static const Color whiteColor = Colors.white;
  static const Color blueColor = Color.fromRGBO(16, 33, 125, 0.8);
  static const Color accentColor = Color(0xff16C2D5);
  static const Color accentBackgroundColor = Color.fromRGBO(47, 128, 237, 0.1);

  // App Theme Constants
  static const EdgeInsetsGeometry pagePadding = EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 12,
  );
  static const EdgeInsetsGeometry pagePaddingHorizontalv20 =
      EdgeInsets.symmetric(
    horizontal: 20,
  );
  static const EdgeInsetsGeometry pagePaddingHorizontalv14 =
      EdgeInsets.symmetric(
    horizontal: 14,
  );

  //Text Style
  //Headings
  static const TextStyle primaryHeadingTextLarge = TextStyle(
    fontSize: 28,
    color: primaryColor,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle primaryHeadingTextMedium = TextStyle(
    fontSize: 20,
    color: primaryColor,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle primaryHeadingTextSmall = TextStyle(
    fontSize: 18,
    color: primaryColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle primaryHeadingTextLargeWhite = TextStyle(
    fontSize: 28,
    color: whiteColor,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle primaryHeadingTextMediumWhite = TextStyle(
    fontSize: 20,
    color: whiteColor,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle primaryHeadingTextSmallWhite = TextStyle(
    fontSize: 18,
    color: whiteColor,
    fontWeight: FontWeight.bold,
  );

  //Body
  static const TextStyle primaryBodyTextLarge = TextStyle(
    fontSize: 14,
    color: whiteColor,
  );
  static const TextStyle primaryBodyTextMedium = TextStyle(
    fontSize: 12,
    color: whiteColor,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle primaryBodyTextSmall = TextStyle(
    fontSize: 10,
    color: whiteColor,
  );

  static const TextStyle primaryBodyTextLargeBlue = TextStyle(
    fontSize: 14,
    color: primaryColor,
  );
  static const TextStyle primaryBodyTextMediumBlue = TextStyle(
    fontSize: 12,
    color: primaryColor,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle primaryBodyTextSmallBlue = TextStyle(
    fontSize: 10,
    color: primaryColor,
  );

  //Text Theme
  static const TextTheme _lightTextTheme = TextTheme(
    displayLarge: primaryHeadingTextMedium,
    bodyLarge: primaryBodyTextMedium,
  );

  //Themes
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: whiteColor,
    appBarTheme: const AppBarTheme(
      color: whiteColor,
      iconTheme: IconThemeData(color: primaryColor),
    ),
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      onPrimary: whiteColor,
      secondary: accentColor,
      primaryContainer: accentBackgroundColor,
    ),
    textTheme: _lightTextTheme,
    useMaterial3: true,
    bottomAppBarTheme: const BottomAppBarTheme(color: primaryColor),
  );
}
