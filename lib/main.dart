import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/login/data/repositories/login_repository.dart';
import 'package:movie_app/config/language/l10n/cubit/language_cubit.dart';
import 'package:movie_app/firebase_options.dart';
import 'package:movie_app/my_app.dart';

import 'Features/login/cubit/login_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase with platform options
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize language cubit after Firebase
  final languageCubit = LanguageCubit();
  await languageCubit.setInitialLanguage();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>(create: (context) => languageCubit),

        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(LoginRepository()),
        ),
      ],
      child: MyApp(),
    ),
  );
}
