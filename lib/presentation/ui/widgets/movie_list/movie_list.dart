import 'package:flutter/material.dart';
import 'package:movie_db/resources/resources.dart';

// создаю класс и конструтор где хранятся данные о фильмах
class Movie {
  final int id;
  final String imageMovie;
  final String nameMovie;
  final String dateMovie;
  final String descriptionMovie;

  Movie({
    required this.id,
    required this.imageMovie,
    required this.nameMovie,
    required this.dateMovie,
    required this.descriptionMovie,
  });
}

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  _MovieListWidgetState createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  // список с фильмами
  final _movies = [
    Movie(
      id: 1,
      imageMovie: Images.godfather,
      nameMovie: 'The Godfather',
      dateMovie: 'March 14, 1972',
      descriptionMovie:
          'Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.',
    ),
    Movie(
      id: 2,
      imageMovie: Images.shawshank,
      nameMovie: 'The Shawshank Redemption',
      dateMovie: 'September 23, 1994',
      descriptionMovie:
          'Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden.',
    ),
    Movie(
      id: 3,
      imageMovie: Images.schindler,
      nameMovie: 'Schindler List',
      dateMovie: 'November 30, 1993',
      descriptionMovie:
          'The true story of how businessman Oskar Schindler saved over a thousand Jewish lives from the Nazis while they worked as slaves in his factory during World War II.',
    ),
    Movie(
      id: 4,
      imageMovie: Images.gabriel,
      nameMovie: 'Gabriel Inferno Part III',
      dateMovie: 'November 19, 2020',
      descriptionMovie:
          'The final part of the film adaption of the erotic romance novel Gabriel Inferno written by an anonymous Canadian author under the pen name Sylvain Reynard.',
    ),
  ];

  var _filteredMovies = <Movie>[];

  // задаю контроллер для отслеживания вводимого текста
  final _searchController = TextEditingController();

  // добавляю функцию, она будет вызываться каждый раз, когда пользователь будет вводить что-то
  void _searchMovies() {
    // если текст вводимый в контроллере не пустой
    final query =
        _searchController.text; // query - текст вводимый пользователем
    if (query.isNotEmpty) {
      // проверяю пустой ли массив
      _filteredMovies = _movies.where((Movie movie) {
        // переводим буквы в нижний регистр, также query перводим в нижний регистр
        return movie.nameMovie.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    // состояние изменилось, поэтому добавляю setState
    setState(() {});
  }

  // обработка ввода текста
  @override
  void initState() {
    super.initState();

    _filteredMovies = _movies;
    _searchController.addListener(
      () {
        _searchMovies();
      },
    );
  }

  void _onMovieTap(int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed('/main_screen/movie_details', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 70),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _filteredMovies
              .length, // показываю _filteredMovies в списке, из него буду доставать элементы
          itemExtent: 180,
          itemBuilder: (BuildContext context, int index) {
            // создаю переменную movie
            // она отображает конкретный фильм из массива _movies по index
            final movie = _filteredMovies[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              // контейнер со скругленной и оформленной рамкой
              child: Stack(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black.withOpacity(0.2),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        // добавляю тень и скругление для тени
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8, // размытие тени
                            offset:
                                const Offset(0, 2), // смещение тени по оси x, y
                          )
                        ]),
                    child: Row(
                      children: [
                        ClipPath(
                          clipper: MyClipper(),
                          child: Image(
                            image: AssetImage(movie.imageMovie),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                movie.nameMovie,
                                maxLines:
                                    1, // задаю 1 строку для текста // при получении данных  с сервера строка может быть очень длинной, возникнет ошибка
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                movie.dateMovie,
                                maxLines: 1, // задаю 1 строку для текста
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                movie.descriptionMovie,
                                maxLines: 2, // задаю 2 строки для текста
                                overflow: TextOverflow
                                    .ellipsis, // добавление ... после обрезания текста
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  Material(
                    // оборачиваю InkWell чтобы получить эффект таба по карточке видимым для пользователя
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10.0),
                      onTap: () => _onMovieTap(index),
                    ),
                  )
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Search',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double factor = 10.0;
    var path = Path();
    path.lineTo(0, size.height - factor);
    path.quadraticBezierTo(0, size.height, factor, size.height);
    path.lineTo(size.width - factor, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(factor, 0);
    path.quadraticBezierTo(0, 0, 0, factor);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
