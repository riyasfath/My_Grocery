import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class AppTheme{
  static Color lightBackgroundColor =  Color(0xfff2f2f2);
  static Color lightPrimaryColor =const Color(0xffff8900);
  static Color lightSecondaryColor =const Color(0xff040415);
  static Color lightAccentColor =  Color(0xFFECEFF1);
  static Color lightParticlesColor =const Color(0x44948282);
  static Color lightTextColor = Color(0xff000000);

  const AppTheme._();

  static final lightTheme =ThemeData(
    brightness: Brightness.light,
    primaryColor:Colors.orange ,
    backgroundColor: lightBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(backgroundColor: lightPrimaryColor),
    colorScheme: ColorScheme.light(secondary: lightSecondaryColor),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: lightBackgroundColor)
    )
  );

  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance!.window.platformBrightness;

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor:lightBackgroundColor,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }

}