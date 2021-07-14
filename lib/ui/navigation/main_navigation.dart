import 'package:flutter/cupertino.dart';
import 'package:strongnews/widgets/auth/auth_model.dart';
import 'package:strongnews/widgets/auth/auth_widget.dart';
import 'package:strongnews/widgets/main_screen/main_screen_model.dart';
import 'package:strongnews/widgets/main_screen/main_screen_widget.dart';

abstract class MainNavigationRouteNames{
  static const auth = 'auth';
  static const mainScreen = '/';
}
class MainNavigation{
  String initialRout(bool isAuth) => isAuth
  ? MainNavigationRouteNames.mainScreen
  : MainNavigationRouteNames.auth;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.auth: (context) => AuthProvider(
        model: AuthModel(),
        child: const AuthWidget()
    ),
    MainNavigationRouteNames.mainScreen: (context) => MainScreenProvider(
        model: MainScreenModel(),
        child: const MainScreenWidget()
    ),
  };

}