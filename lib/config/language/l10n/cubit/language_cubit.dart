import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  static final Locale _ar = Locale('ar');
  static final Locale _en = Locale('en');

  LanguageCubit() : super(LanguageState(_en));

  static LanguageCubit get(BuildContext context) =>
      BlocProvider.of<LanguageCubit>(context);

  void changeLanguage(Locale locale) {
    _saveLanguage(locale == _en);
    emit(LanguageState(locale));
  }

  Future<void> _saveLanguage(bool isEnglish) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isEnglish", isEnglish);
  }

  Future<bool> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isEnglish") ?? true; // Default English
  }

  Future<void> setInitialLanguage() async {
    final isEnglish = await _loadLanguage();
    final language = isEnglish ? _en : _ar;
    emit(LanguageState(language));
  }
}
