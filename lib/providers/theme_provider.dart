import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _selectedTheme = false;
  late ThemeData _themeData = lightTheme;

  final darkTheme = ThemeData.dark().copyWith(
    iconTheme: IconThemeData(
      color: Colors.blue.shade900,
    ),
  );

  final lightTheme = ThemeData.light();

  get selectedTheme {
    return _selectedTheme;
  }

  // final lightTheme = ThemeData(
  //   primarySwatch: Colors.grey,
  //   primaryColor: Colors.white,
  //   brightness: Brightness.light,
  //   backgroundColor: const Color(0xFFE5E5E5),
  //   dividerColor: Colors.white54,
  // );

  ThemeData get themeData {
    return _themeData;
  }

  void changeThemeData() {
    if (_selectedTheme) {
      _themeData = lightTheme;
      _selectedTheme = !_selectedTheme;
    } else {
      _themeData = darkTheme;
      _selectedTheme = !_selectedTheme;
    }
    notifyListeners();
  }
}
