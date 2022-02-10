import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_db/presentation/ui/widgets/auth/auth_widget.dart';
import 'package:movie_db/presentation/ui/widgets/error_screen/error_screen_widget.dart';
import 'package:movie_db/presentation/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:movie_db/theme/app_colors.dart';

import 'generated/l10n.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          // изменяю цвет фона AppBar
          backgroundColor: AppColors.mainDarkBlue,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainDarkBlue,
          // цвет иконки, когда активна
          selectedItemColor: Colors.white,
          // цвет иконки, когда не активна
          unselectedItemColor: Colors.grey,
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
