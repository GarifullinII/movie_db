// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "auth_w_title":
            MessageLookupByLibrary.simpleMessage("Login to your account"),
        "form_w_login": MessageLookupByLibrary.simpleMessage("Login"),
        "form_w_password": MessageLookupByLibrary.simpleMessage("Password"),
        "form_w_reset_password":
            MessageLookupByLibrary.simpleMessage("Reset password"),
        "form_w_username": MessageLookupByLibrary.simpleMessage("Username"),
        "header_w_register": MessageLookupByLibrary.simpleMessage(
            "You must be logged into your account in order to use the edits and features of the TMDB rankings, as well as receive personalized recommendations. If you don\'t have an account, registering one is free and easy."),
        "header_w_register_button":
            MessageLookupByLibrary.simpleMessage("Register"),
        "header_w_verify": MessageLookupByLibrary.simpleMessage(
            "If you registered but did not receive a confirmation email, please click here to resend the email."),
        "header_w_verify_button":
            MessageLookupByLibrary.simpleMessage("Verify email")
      };
}
