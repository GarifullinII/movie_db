import 'package:flutter/material.dart';
import 'package:movie_db/widgets/auth/auth_widget.dart';
import 'package:movie_db/widgets/main_screen/main_screen.dart';
import 'package:movie_db/widgets/error_screen/error_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          // изменяю цвет фона AppBar
          backgroundColor: Color.fromRGBO(3, 37, 65, 1),
        ),
      ),
      // указываю имя первого экрана AuthWidget
      initialRoute: '/auth',
      // описываю маршруты которые есть
      routes: {
        '/auth': (context) => const AuthWidget(),
        '/main_screen': (context) => const MainScreenWidget(),
        '/error_screen': (context) => const ErrorScreenWidget(),
      },
      // генерация route, в случае если не найдены указанные routes страницы
      // всегда позволяет вернуться куда-нибудь
      // onGenerateRoute: (RouteSettings settings) {
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return const Scaffold(
      //         body: Center(
      //           child: Text(
      //             'Ooops navigation error',
      //           ),
      //         ),
      //       );
      //     },
      //   );
      // },
    );
  }
}
