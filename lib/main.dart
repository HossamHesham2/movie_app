import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/Features/auth/data/repositories/auth_repository_impl.dart';
import 'package:movie_app/Features/auth/presentation/login/cubit/login_cubit.dart';
import 'package:movie_app/Features/auth/presentation/register/cubit/register_cubit.dart';
import 'package:movie_app/Features/movie/movie_details/data/data_source_impl/movie_details_movie_remote_impl_ds.dart';
import 'package:movie_app/Features/movie/movie_details/data/repository/movie_details_repository_impl.dart';
import 'package:movie_app/Features/movie/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'package:movie_app/Features/movie/tabs/home/data/data_source_impl/home_movie_remote_impl_ds.dart';
import 'package:movie_app/Features/movie/tabs/home/data/repository/home_repository_impl.dart';
import 'package:movie_app/Features/movie/tabs/home/presentation/home/cubits/home_cubit.dart';
import 'package:movie_app/core/database/api/dio_consumer.dart';
import 'package:movie_app/core/utils/my_bloc_observer.dart';
import 'package:movie_app/my_app.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/language/l10n/cubit/language_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter();
  Bloc.observer = MyBlocObserver();
  Hive.init(appDocumentsDir.path);
  final languageCubit = LanguageCubit();
  await SharedPreferences.getInstance();
  await languageCubit.setInitialLanguage();
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
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(
            HomeRepositoryImpl(HomeMovieRemoteImplDs(DioConsumer(dio: Dio()))),
          ),
        ),
        BlocProvider<MovieDetailsCubit>(
          create: (context) => MovieDetailsCubit(
            MovieDetailsRepositoryImpl(MovieDetailsRemoteImplDs(DioConsumer(dio: Dio()))),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}
