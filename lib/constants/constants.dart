import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();

  static const String imgAssetPokeTitle = "assets/images/pokeball_title.png";
  static const String imgAssetPokeItem = "assets/images/pokeball_item.png";

  static const String title = "Pokedex";

  static TextStyle getTitleTextStyle() => TextStyle(
      fontSize: _calcFontSize(48),
      fontWeight: FontWeight.bold,
      color: Colors.white);

  static TextStyle getPokeNameTextStyle() => TextStyle(
      fontSize: _calcFontSize(30),
      fontWeight: FontWeight.bold,
      color: Colors.white);

  static TextStyle getTypeChipTextStyle() =>
      TextStyle(fontSize: _calcFontSize(20), color: Colors.white);

  static TextStyle getDetailKeyTextStyle() => TextStyle(
      fontSize: _calcFontSize(22),
      color: Colors.black,
      fontWeight: FontWeight.bold);

  static TextStyle getDetailValueTextStyle() => TextStyle(
      fontSize: _calcFontSize(15),
      color: Colors.black,
      fontWeight: FontWeight.normal);

  static double _calcFontSize(double size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size;
    } else {
      return size * 1.2;
    }
  }
}
