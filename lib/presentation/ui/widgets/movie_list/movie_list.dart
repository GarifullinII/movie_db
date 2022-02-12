import 'package:flutter/material.dart';
import 'package:movie_db/resources/resources.dart';

// создаю класс и конструтор где хранятся данные о фильмах
class Movies {
  final String imageMovie;
  final String nameMovie;
  final String dateMovie;
  final String descriptionMovie;

  Movies({
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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemExtent: 180,
      itemBuilder: (BuildContext context, int index) {
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
                        offset: const Offset(0, 2), // смещение тени по оси x, y
                      )
                    ]),
                child: Row(
                  children: [
                    ClipPath(
                      clipper: MyClipper(),
                      child: const Image(
                        image: AssetImage(Images.godfather),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'The Godfather',
                            maxLines:
                                1, // задаю 1 строку для текста // при получении данных  с сервера строка может быть очень длинной, возникнет ошибка
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'March 14, 1972',
                            maxLines: 1, // задаю 1 строку для текста
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.',
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
                  onTap: () {},
                ),
              )
            ],
          ),
        );
      },
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
