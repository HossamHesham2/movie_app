import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/Features/auth/data/models/user_model.dart';
import 'package:movie_app/Features/auth/data/repositories/auth_repository_impl.dart';
import 'package:movie_app/Features/auth/presentation/login/cubit/login_cubit.dart';
import 'package:movie_app/Features/auth/presentation/register/cubit/register_cubit.dart';
import 'package:movie_app/my_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/language/l10n/cubit/language_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  final languageCubit = LanguageCubit();
  await SharedPreferences.getInstance();
  await languageCubit.setInitialLanguage();
  Hive.registerAdapter(UserModelAdapter());
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>(create: (context) => languageCubit),

        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(AuthRepositoryImpl()),
        ),
        BlocProvider<RegisterCubit>(
          create: (context) => RegisterCubit(AuthRepositoryImpl()),
        ),
      ],
      child: MyApp(),
    ),
  );
}
