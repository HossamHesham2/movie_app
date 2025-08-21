import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/config/language/l10n/cubit/language_cubit.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final languageCubit = LanguageCubit();
  await languageCubit.setInitialLanguage();
  runApp(BlocProvider.value(value: languageCubit, child: MyApp()));
}
