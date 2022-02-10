import 'package:flutter/material.dart';
import 'package:movie_db/theme/app_button_style.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login to your account',
        ),
      ),
      body: ListView(
        children: const [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  // два контроллера
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  String? errorText = null;

  @override
  Widget build(BuildContext context) {
    // выношу схожие стили для текста в const
    const textStyle = TextStyle(
      fontSize: 14,
      color: Color(0xFF212529),
    );

    // задаю цвет рамки для активного input
    const color = Color(0xFF01B4E4);

    // выношу схожие стили для input decoration
    const inputDecoration = InputDecoration(
      border: OutlineInputBorder(),
      // устанавливаю padding для вводимого текста
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10, // после изменения isCollapsed, меняю вертикальные отступы
      ),
      // уменьшаю отступ вводимого теста по вертикали
      isCollapsed: true,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
        ),
      ),
    );

    final errorText = this.errorText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(
            errorText,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
        const Text(
          'Username',
          style: textStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: _loginTextController,
          decoration: inputDecoration,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Password',
          style: textStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: _passwordTextController,
          decoration: inputDecoration,
          // скрываю вводимые данные
          obscureText: true,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: _auth,
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(color),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              child: const Text(
                'Login',
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            TextButton(
              onPressed: _resetPassword,
              style: AppButtonStyle.linkButton,
              child: const Text(
                'Reset password',
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;

    if (login == 'admin' && password == 'admin') {
      errorText = null;

      // открывает новую страницу, нет возможности вернуться на предыдущую страницу
      Navigator.pushReplacementNamed(context, '/main_screen');

    } else {
      errorText = 'Invalid login or password';
      Navigator.pushNamed(context, '/error_screen');
    }
    setState(() {});
  }

  void _resetPassword() {
    print('reset password');
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // выношу схожие стили для текста в const
    const textStyle = TextStyle(
      fontSize: 14,
      color: Colors.black,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          const _FormWidget(),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "You must be logged into your account in order to use the edits and features of the TMDB rankings, as well as receive personalized recommendations. If you don't have an account, registering one is free and easy.",
            style: textStyle,
          ),
          const SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Register',
            ),
            style: AppButtonStyle.linkButton,
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "If you registered but did not receive a confirmation email, please click here to resend the email.",
            style: textStyle,
          ),
          const SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Verify email',
            ),
            style: AppButtonStyle.linkButton,
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
