import 'package:flutter/material.dart';
import 'package:strongnews/resources/my_flutter_app_icons.dart';
import 'package:strongnews/widgets/movie_list/movie_list_widget.dart';
import 'package:strongnews/widgets/movie_list/news_list_widget.dart';

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
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    const alt_news = 'Новости';
    const alt_video = 'Видео';
    const alt_lk = 'ЛК';
    const alt_magazine = 'Магазин';
    const alt_about = 'О нас';
    return Scaffold(
      appBar: AppBar(title: Text('Strong News'),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          NewsListWidget(),
          MovieListWidget(),
          Center(child: Text(alt_lk)),
          Center(child: Text(alt_magazine)),
          Center(child: Text(alt_about)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        fixedColor: Color(0xFFEE0000),
        unselectedItemColor: Colors.grey,
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
              icon: Icon(Icons.person_outline),
            label: alt_lk
          ),
          BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.dumbbell),
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
