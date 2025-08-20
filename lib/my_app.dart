import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/routes/routes_manager.dart';
import 'package:movie_app/core/styles/style_manager.dart';

import 'config/l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      splitScreenMode: true,
      ensureScreenSize: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale('en'),
        darkTheme: ThemeData(scaffoldBackgroundColor: StyleManager.black12),
        themeMode: ThemeMode.dark,

        onGenerateRoute: RoutesManager.getRoutes,
        initialRoute: RoutesManager.loginView,
      ),
    );
  }
}
