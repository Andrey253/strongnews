import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_colors.dart';
import 'package:themoviedb/widgets/auth/auth_widget.dart';
import 'package:themoviedb/widgets/main_screen/main_screen_widget.dart';
import 'package:themoviedb/widgets/movie_details/movie_details_widget.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Strong News',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: AppColors.mainDarkBlue),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainDarkBlue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.blueGrey,
        ),
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => AuthWidget(),
        '/main_screen': (context) => MainScreenWidget(),
        '/main_screen/movie_datails': (context) {
          final id = ModalRoute.of(context)?.settings.arguments as int;
          if (id is int)
            return MovieDetailsWidget(movieId: id,);
          else
            return MovieDetailsWidget(movieId: 0,);}
      },
      initialRoute: "/main_screen",
    );
  }
}
