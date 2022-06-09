
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper {
  UIHelper._();

  static double getAppTitleWidgetHeight() {
    return ScreenUtil().orientation == Orientation.portrait ? 0.15.sh : 0.15.sw;
  }

  static EdgeInsets getDefaultPadding() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return EdgeInsets.all(12.h);
    } else {
      return EdgeInsets.all(20.h);
    }
  }

  static int getGridDelegeCount() {
    return ScreenUtil().orientation == Orientation.portrait ? 2 : 3;
  }

  static getPokeItemSize() {
    return ScreenUtil().orientation == Orientation.portrait ? 300.h : 500.h;
  }

  static final Map<String, Color> _typeColor = {
    "Grass": Colors.green,
    "Fire": Colors.redAccent,
    "Water": Colors.blue,
    "Electric": Colors.yellow,
    "Rock": Colors.grey,
    "Ground": Colors.brown,
    "Bug": Colors.lightGreenAccent,
    "Psychic": Colors.indigo,
    "Fighting": Colors.orange,
    "Ghost": Colors.deepPurple,
    "Normal": Colors.black26,
    "Poison": Colors.deepPurpleAccent
  };

  static Color getItemColor(List<String> type) {
    //  debugPrint("gelen type ${type[0]}");
    if (_typeColor.containsKey(type[0])) {
      return _typeColor[type[0]] ?? Colors.pink.shade300;
    } else {
      return Colors.pink.shade300;
    }
  }

  static String getListToString(List<String> list) {
    String str = "";
    int sayac = 0;

    for (String i in list) {
      if (list.elementAt(sayac) != list.last) {
        str += "$i, ";
      } else {
        str += i;
      }
      sayac += 1;
    }
    return str;
  }
}
