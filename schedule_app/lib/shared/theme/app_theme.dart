import 'package:flutter/material.dart';
import 'package:schedule_app/shared/theme/app_colors.dart';
import 'package:schedule_app/shared/theme/app_fonts.dart';

class AppTheme {
  static ThemeData materialTheme(BuildContext context) {
    return ThemeData(
        appBarTheme: const AppBarTheme(
          toolbarHeight: 60,
          titleTextStyle: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, letterSpacing: 1.0),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(16.0),
            ),
          ),
        ),
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        primarySwatch: AppColors.deepPurpleSwatch,
        primaryColor: AppColors.deepPurple,
        primaryColorLight: AppColors.deepPurpleLight,
        primaryColorDark: AppColors.deepPurpleDark,
        textTheme: AppFonts.textTheme,
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: AppColors.deepPurple),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.deepPurple),
          ),
        ));
  }
}
