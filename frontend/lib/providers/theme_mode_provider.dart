import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.system);

  void toggleThemeMode(int index) {
    if (index == 0) {
      state = ThemeMode.system;
    } else if (index == 1) {
      state = ThemeMode.light;
    } else if (index == 2) {
      state = ThemeMode.dark;
    }
  }
}

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
  (ref) => ThemeModeNotifier(),
);
