import 'package:flutter/material.dart';

abstract class AppColors{
  static const  mainDarkBlue = const Color.fromRGBO(3, 37, 65, 1);
}
abstract class AppBoxDecoration{
  static const  appGradient = const BoxDecoration(
    gradient: LinearGradient(
      colors: [Color.fromRGBO(184, 75, 114, 1), Color.fromRGBO(226, 63, 70, 1)],
      begin: FractionalOffset.bottomLeft,
      end: FractionalOffset.topRight,
    ),
  );
}