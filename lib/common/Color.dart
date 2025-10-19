import 'package:flutter/material.dart';

class AppColors {

  static final primaryColor =HexColor("#E65C00");
  static final themeAppColor =HexColor("#E65C00");
  static final primaryLightColor = Color.fromARGB(255, 247, 235, 252);
  static final backgroundColor = HexColor("#E65C00");
  static final SecondbackgroundColor = Color(0xFFE5E5E5);
  static final ThirdbackgroundColor = Color(0xFFF6F6F6);
  static final homeTextColor1 = Color(0xFF404040);
  static final homeTextColor2 = Color(0xFF262626);
  static final homeTextColor3 = Color(0xFF7D7D7D);
  static final redTextColor = Color(0xFFE03131);
  static final white = Colors.white;

  static const Color lightGrey = Color(0xFFF0F0F0); // For background
  static const Color greyText = Color(0xFF888888); // For 'In stock' text
  static const Color black = Color(0xFF000000); // For product names

  static final greenTextColor = Color(0xFF2F9E44);
  static final ThirdColor = Color(0xFF00AEF0);
  static final homeCardBg = Color(0xFFF6F8F6);
  static final SectionCardBg = Color.fromARGB(255, 230, 230, 230);
  static final tableRowColor = Color(0xFFF2F3F3);
  static final SectionHighLightCardBg = Color.fromARGB(255, 202, 201, 201);
  static final primarydeepLightColor = Color(0xFFEBCEFF);
  static final dividerColor = Color(0xFFEEEEEE);
  static final golden = HexColor("#FFCF40");
  static final gradientOne = HexColor("#6D3587");
  static final gradientTwo = HexColor("#8950A4");
  static final softPink = HexColor("#FFC5C5");
 static final softBrwn = HexColor("#FFEBD8");
  static Color textAlt = HexColor("#505050");
  static Color textColorBlack = Colors.black;
 // static final gradientTwo = HexColor("#8950A4");
 // static final gradientTwo = HexColor("#8950A4");
 // static final gradientTwo = HexColor("#8950A4");


}
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}