import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      // colorScheme: const ColorScheme.dark(),
      primaryColor: Colors.blue,
      primaryColorDark: Colors.blue,
      primaryColorLight: Colors.blue,
      //primaryColorLight: Colors.black,
      brightness: Brightness.dark,
      //primaryColorDark: Colors.black,
      indicatorColor: Colors.white,
      canvasColor: Colors.black,
      // next line is important!
      appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light), checkboxTheme: CheckboxThemeData(
 fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return Colors.blue[300]; }
 return null;
 }),
 ), radioTheme: RadioThemeData(
 fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return Colors.blue[300]; }
 return null;
 }),
 ), switchTheme: SwitchThemeData(
 thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return Colors.blue[300]; }
 return null;
 }),
 trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return Colors.blue[300]; }
 return null;
 }),
 ));

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      // colorScheme: const ColorScheme.light(),
      // primaryColor: Colors.blue,
      // primaryColorDark: Colors.blue,
      primaryColor: Colors.blue[300],
      brightness: Brightness.light,
      primaryColorDark: Colors.black,
      canvasColor: Colors.blue,
      // next line is important!
      appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark), checkboxTheme: CheckboxThemeData(
 fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return Colors.blue[300]; }
 return null;
 }),
 ), radioTheme: RadioThemeData(
 fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return Colors.blue[300]; }
 return null;
 }),
 ), switchTheme: SwitchThemeData(
 thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return Colors.blue[300]; }
 return null;
 }),
 trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return Colors.blue[300]; }
 return null;
 }),
 ));
}
