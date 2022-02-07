import 'package:flutter/material.dart';
import 'package:movie_db/theme/app_button_style.dart';

class ErrorScreenWidget extends StatefulWidget {
  const ErrorScreenWidget({Key? key}) : super(key: key);

  @override
  _ErrorScreenWidget createState() => _ErrorScreenWidget();
}

class _ErrorScreenWidget extends State<ErrorScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ooops error'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              '404',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'PAGE NOT FOUND',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Back',
              ),
              style: AppButtonStyle.linkButton,
            ),
          ],
        ),
      ),
    );
  }
}
