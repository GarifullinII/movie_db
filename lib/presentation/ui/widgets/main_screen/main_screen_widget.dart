import 'package:flutter/material.dart';
import 'package:movie_db/presentation/ui/widgets/movie_list/movie_list.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDB'),
      ),
      // особенность виджета в том, что его дети существуют одновременно, но отображается только один из них
      // следовательно пр переключении ни один из них не удаляется из памяти и их состояние также сохраняется
      // больше расход памяти (до ввода redux буду использовать)
      body: IndexedStack(
        index: _selectedTab,
        children: const [
          Text(
            'News',
          ),
          MovieListWidget(),
          Text(
            'TV show',
          ),
        ],
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
