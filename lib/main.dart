import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/Features/auth/presentation/login/cubit/login_cubit.dart';
import 'package:movie_app/Features/auth/presentation/register/cubit/register_cubit.dart';
import 'package:movie_app/Features/movie/movie_details/data/model/get_movie_details_response.dart';
import 'package:movie_app/Features/movie/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'package:movie_app/Features/movie/tabs/browse/presentation/cubits/browse_cubit.dart';
import 'package:movie_app/Features/movie/tabs/home/presentation/home/cubits/home_cubit.dart';
import 'package:movie_app/Features/movie/tabs/profile/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:movie_app/Features/movie/tabs/profile/presentation/cubits/profile_cubit.dart';
import 'package:movie_app/Features/movie/tabs/search/presentation/cubits/search_cubit.dart';
import 'package:movie_app/core/models/get_all_movie_response.dart'
    as getAllMovieResponse;
import 'package:movie_app/core/utils/my_bloc_observer.dart';
import 'package:movie_app/my_app.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/language/l10n/cubit/language_cubit.dart';
import 'core/di/dependency_injection.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter();
  Hive.init(appDocumentsDir.path);
  Hive.registerAdapter(getAllMovieResponse.GetAllMovieResponseAdapter());
  Hive.registerAdapter(getAllMovieResponse.DataAdapter());
  Hive.registerAdapter(getAllMovieResponse.MoviesAdapter());
  Hive.registerAdapter(getAllMovieResponse.TorrentsAdapter());
  Hive.registerAdapter(GetMovieDetailsResponseAdapter());
  Hive.registerAdapter(DataAdapter());
  Hive.registerAdapter(TorrentsAdapter());

  Bloc.observer = MyBlocObserver();
  final languageCubit = LanguageCubit();
  await SharedPreferences.getInstance();
  await languageCubit.setInitialLanguage();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>(create: (context) => languageCubit),
        BlocProvider<LoginCubit>(create: (context) => getIt<LoginCubit>()),
        BlocProvider<RegisterCubit>(
          create: (context) => getIt<RegisterCubit>(),
        ),
        BlocProvider<HomeCubit>(create: (context) => getIt<HomeCubit>()),
        BlocProvider<MovieDetailsCubit>(
          create: (context) => getIt<MovieDetailsCubit>(),
        ),
        BlocProvider<SearchCubit>(create: (context) => getIt<SearchCubit>()),

        BlocProvider<BrowseCubit>(create: (context) => getIt<BrowseCubit>()),
        BlocProvider<EditProfileCubit>(
          create: (context) => getIt<EditProfileCubit>(),
        ),
        BlocProvider<ProfileCubit>(create: (context) => getIt<ProfileCubit>()),
      ],
      child: MyApp(),
    ),
  );
}
