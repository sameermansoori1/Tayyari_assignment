import 'package:flutter/material.dart';
import 'sub_theme_data_mixin.dart';

const Color kPrimayColorDT = Colors.blue;
const Color kPrimayLightColorDT = Colors.lightBlue;
const Color appBarIconColorDT = Colors.white;
const Color mainTextColorDT =Color.fromARGB(255, 40, 40, 40);
const Color iconColorDT = Colors.white;
const Color shadowColorDT = Color.fromARGB(90, 172, 172, 172);
const Color cardColorDT = Color.fromARGB(255, 254, 254, 255);
const Color scaffoldBackgroundColor =Color.fromARGB(255, 240, 237, 255);

class DarkTheme with SubThemeData {
  ThemeData buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
       visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        splashColor: kPrimayColorDT.withOpacity(0.1),
        highlightColor: kPrimayColorDT.withOpacity(0.05),
        iconTheme: getIconTheme(),
        textTheme: getTextThemes().apply(
          bodyColor: mainTextColorDT,
          displayColor: mainTextColorDT
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: getElavatedButtonTheme()),
        cardColor: cardColorDT,
        primaryColor: kPrimayColorDT);
  }
}
