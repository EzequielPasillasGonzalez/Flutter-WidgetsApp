import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
    : assert(
        selectedColor >= 0 && selectedColor < colorList.length,
        'Selected color index is out of range ${colorList.length - 1}',
      );

  ThemeData getTheme() => ThemeData(
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: AppBarTheme(centerTitle: false),
  );
}
