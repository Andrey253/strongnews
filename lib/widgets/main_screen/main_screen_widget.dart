
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
    const alt_news = 'Новости';
    const alt_video = 'Видео';
    const alt_lk = 'Личные настройки';
    const alt_magazine = 'Магазин';
    const alt_about = 'О нас';
    return Scaffold(
      appBar: AppBar(title: Text('Strong News'),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          Center(child: Text(alt_news)),
          MovieListWidget(),
          Center(child: Text(alt_lk)),
          Center(child: Text(alt_magazine)),
          Center(child: Text(alt_about)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        fixedColor: Color(0xFFD50000),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: alt_news,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.tv_sharp),
            label: alt_video
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
            label: alt_lk
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_volleyball_sharp),
              label: alt_magazine
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.flag_outlined),
              label: alt_about
          ),
        ],
      onTap: (index){
        onSelectesTap(index);
      },
      ),
    );
  }
}
