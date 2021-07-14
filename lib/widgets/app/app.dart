import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:strongnews/Theme/app_colors.dart';
import 'package:strongnews/ui/navigation/main_navigation.dart';

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Strong News',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: AppColors.mainDarkBlue),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainDarkBlue,
        ),
      ),
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRout(false),
    );
  }
}