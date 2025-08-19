import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/routes/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      splitScreenMode: true,
      ensureScreenSize: true,
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        onGenerateRoute: RoutesManager.getRoutes,
        initialRoute: RoutesManager.mainLayout,
      ),
    );
  }
}
