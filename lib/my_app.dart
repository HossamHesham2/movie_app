import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/language/l10n/app_localizations.dart';
import 'package:movie_app/config/language/l10n/cubit/language_cubit.dart';
import 'package:movie_app/config/routes/routes_manager.dart';
import 'package:movie_app/core/constants/constants_manager.dart';
import 'package:movie_app/core/styles/style_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn =
        prefs.getBool(ConstantsManager.ISLOGGEDIN_KEY) ??
        false; // أو ConstantsManager.TOKEN_KEY
    return isLoggedIn;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      splitScreenMode: true,
      ensureScreenSize: true,
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return FutureBuilder(
            future: isLoggedIn(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final initialRoute = snapshot.data!
                  ? RoutesManager.mainLayoutView
                  : RoutesManager.onBoardingView;
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: state.locale,
                darkTheme: ThemeData(
                  scaffoldBackgroundColor: StyleManager.black12,
                ),
                themeMode: ThemeMode.dark,
                onGenerateRoute: RoutesManager.getRoutes,
                initialRoute: initialRoute,
              );
            },
          );
        },
      ),
    );
  }
}
