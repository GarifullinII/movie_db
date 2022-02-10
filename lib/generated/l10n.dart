// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login to your account`
  String get auth_w_title {
    return Intl.message(
      'Login to your account',
      name: 'auth_w_title',
      desc: '',
      args: [],
    );
  }

  /// `You must be logged into your account in order to use the edits and features of the TMDB rankings, as well as receive personalized recommendations. If you don't have an account, registering one is free and easy.`
  String get header_w_register {
    return Intl.message(
      'You must be logged into your account in order to use the edits and features of the TMDB rankings, as well as receive personalized recommendations. If you don\'t have an account, registering one is free and easy.',
      name: 'header_w_register',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get header_w_register_button {
    return Intl.message(
      'Register',
      name: 'header_w_register_button',
      desc: '',
      args: [],
    );
  }

  /// `If you registered but did not receive a confirmation email, please click here to resend the email.`
  String get header_w_verify {
    return Intl.message(
      'If you registered but did not receive a confirmation email, please click here to resend the email.',
      name: 'header_w_verify',
      desc: '',
      args: [],
    );
  }

  /// `Verify email`
  String get header_w_verify_button {
    return Intl.message(
      'Verify email',
      name: 'header_w_verify_button',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get form_w_username {
    return Intl.message(
      'Username',
      name: 'form_w_username',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get form_w_password {
    return Intl.message(
      'Password',
      name: 'form_w_password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get form_w_login {
    return Intl.message(
      'Login',
      name: 'form_w_login',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get form_w_reset_password {
    return Intl.message(
      'Reset password',
      name: 'form_w_reset_password',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
