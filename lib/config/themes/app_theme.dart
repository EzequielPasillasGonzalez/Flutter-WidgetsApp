import 'package:flutter/material.dart';

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  static const colorList = <Color>[
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
  ];

  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
    : assert(
        selectedColor >= 0 && selectedColor < colorList.length,
        'Selected color index is out of range ${colorList.length - 1}',
      );

  ThemeData getTheme() => ThemeData(
    colorSchemeSeed: colorList[selectedColor],
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    appBarTheme: const AppBarTheme(centerTitle: false),
  );

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
    //* Si se recibe un valor nuevo lo usa, sino usa el valor actual
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkMode: isDarkMode ?? this.isDarkMode,
  );
}
