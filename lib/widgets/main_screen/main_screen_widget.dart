import 'package:flutter/material.dart';
import 'package:strongnews/resources/app_icons.dart';
import 'package:strongnews/resources/app_strings.dart';
import 'package:strongnews/widgets/main_screen/layouts/about_widget.dart';
import 'package:strongnews/widgets/main_screen/layouts/user_widget.dart';
import 'package:strongnews/widgets/main_screen/layouts/magazine_widget.dart';
import 'layouts/movie_list_widget.dart';
import 'layouts/news_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);
  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}
class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;
  void onSelectesTap(int index){
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Strong News'),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          NewsListWidget(),
          MovieListWidget(),
          UserWidget(),
          MagazineWidget(),
          AboutWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        fixedColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem( icon: Icon(Icons.list_alt), label: AppWidgetName.alt_news),
          BottomNavigationBarItem( icon: Icon(Icons.tv_sharp), label: AppWidgetName.alt_video),
          BottomNavigationBarItem( icon: Icon(Icons.person_outline),label: AppWidgetName.alt_lk),
          BottomNavigationBarItem( icon: Icon(MyFlutterApp.dumbbell), label: AppWidgetName.alt_magazine),
          BottomNavigationBarItem( icon: Icon(Icons.flag_outlined), label: AppWidgetName.alt_about),
        ],
      onTap: (index){
        onSelectesTap(index);
      },
      ),
    );
  }
}
