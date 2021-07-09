
import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_colors.dart';
import 'package:themoviedb/widgets/movie_list/movie_list_widget.dart';

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
      appBar: AppBar(title: Text('TMDB'),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          Text('Новости'),
          MovieListWidget(),
          Text('Личные данные'),
          Text('Снаряды'),
          Text('О нас'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        fixedColor: Color(0xFFD50000),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'Новости',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.tv_sharp),
            label: 'Видео'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
            label: 'Личные настройки'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_volleyball_sharp),
              label: 'Снаряды'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.flag_outlined),
              label: 'О нас'
          ),
        ],
      onTap: (index){
        onSelectesTap(index);
      },
      ),
    );
  }
}
