import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:widgets_app/config/themes/app_theme.dart';

// Estado => isdarkModeProvider = boolean
class DarkModeNotifier extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  void toogleDarkMode() {
    state = !state;
  }
}

final darkModeProvider = NotifierProvider<DarkModeNotifier, bool>(() {
  return DarkModeNotifier();
});

// * Listado de colores inmutables
class ColorListNotifier extends Notifier<List<Color>> {
  @override
  List<Color> build() {
    return colorList;
  }
}

final colorThemeProvider = NotifierProvider<ColorListNotifier, List<Color>>(() {
  return ColorListNotifier();
});

// ** Color seleccionado
class SelectedColorThemeNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void selectedColorTheme(int index) {
    state = index;
  }
}

final selectedColorThemeProvider =
    NotifierProvider<SelectedColorThemeNotifier, int>(() {
      return SelectedColorThemeNotifier();
    });
