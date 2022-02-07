import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {

  // по умолчанию будет выделена первая иконка 'News'
  int _selectedTab = 0;

  // функция для управления индексом, который был нажат
  void onSelectTab(int index){

    // если индекс равен ранее выбранному индексу, то мы делаем выход из функции
    // те не будет обновляться стейт, если вкладка уже выбрана
    if (_selectedTab == index) return;

    // добавляю setState, так как буду обновлять state
    setState(() {
      _selectedTab = index;
    });
  }

  // получение вкладок при нажатии на иконки
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'News',
    ),
    Text(
      'Movies',
    ),
    Text(
      'TV show',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDB'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedTab),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // задаю индекс
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'TV show',
          ),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
