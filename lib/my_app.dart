import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/language/l10n/app_localizations.dart';
import 'package:movie_app/config/language/l10n/cubit/language_cubit.dart';
import 'package:movie_app/config/routes/routes_manager.dart';
import 'package:movie_app/core/constants/constants_manager.dart';
import 'package:movie_app/core/styles/style_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isLogged;
  bool? isSeen;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    isLogged = prefs.getBool(ConstantsManager.isLoggedInKey) ?? false;
    isSeen = prefs.getBool(ConstantsManager.isSeenKey) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      splitScreenMode: true,
      ensureScreenSize: true,
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          final initialRoute = isLogged!
              ? RoutesManager.mainLayoutView
              : isSeen!
              ? RoutesManager.loginView
              : RoutesManager.onBoardingView;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: state.locale,
            darkTheme: ThemeData(scaffoldBackgroundColor: StyleManager.black12),
            themeMode: ThemeMode.dark,
            onGenerateRoute: RoutesManager.getRoutes,
            initialRoute: initialRoute,
          );
        },
      ),
    );
  }
}
