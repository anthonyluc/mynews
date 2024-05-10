import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    brightness: Brightness.light,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      unselectedItemColor: Color(0xffacacac),
      unselectedLabelStyle: TextStyle(
        color: Color(0xffacacac),
      ),
      selectedItemColor: Colors.blue,
    ),
  );

  static final _darkTheme = ThemeData(
    brightness: Brightness.dark,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white, backgroundColor: Colors.black),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      unselectedItemColor: Color(0xffacacac),
      unselectedLabelStyle: TextStyle(
        color: Color(0xffacacac),
      ),
      selectedItemColor: Colors.amber,
    ),
    //scaffoldBackgroundColor: const Color(0xFF090C22),
    scaffoldBackgroundColor: Colors.black,
  );

  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}
