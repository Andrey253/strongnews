import 'package:flutter/material.dart';

abstract class AppColors{
  static const  mainDarkBlue = const Color.fromRGBO(3, 37, 65, 1);
  static const  mainColor1 = const Color.fromRGBO(184, 75, 114, 1);
  static const  mainColor2 = const Color.fromRGBO(226, 63, 70, 1);
}
abstract class AppBoxDecoration{
  static const  appGradient = const BoxDecoration(
    gradient: LinearGradient(
      colors: [AppColors.mainColor1, AppColors.mainColor2],
      begin: FractionalOffset.bottomLeft,
      end: FractionalOffset.topRight,
    ),
  );
}