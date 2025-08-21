import 'package:flutter/cupertino.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';

class ValidatorsManager {

  static String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.appLocalizations!.email_required;
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return context.appLocalizations!.email_invalid;
    }
    return null;
  }

  static String? validatePassword(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.appLocalizations!.password_required;
    }
    if (value.length < 8) {
      return context.appLocalizations!.password_min_length;
    }
    return null;
  }

  static String? validateName(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.appLocalizations!.name_required;
    }
    return null;
  }

  static String? validatePhone(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.appLocalizations!.phone_required;
    }
    if (value.length < 8) {
      return context.appLocalizations!.phone_invalid;
    }
    return null;
  }

  static String? validateConfirmPassword(
    String? confirmPassword,
    String? password,
    BuildContext context,
  ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return context.appLocalizations!.confirm_password_required;
    }
    if (confirmPassword != password) {
      return context.appLocalizations!.passwords_not_match;
    }
    return null;
  }
}
