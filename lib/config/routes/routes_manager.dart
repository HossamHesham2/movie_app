import 'package:flutter/cupertino.dart';
import 'package:movie_app/Features/login/view/login_view.dart';
import 'package:movie_app/Features/main_layout/main_layout_view.dart';
import 'package:movie_app/Features/onBoardingView/on_boarding_view.dart';
import 'package:movie_app/Features/register/view/register_view.dart';

class RoutesManager {
  static const String mainLayout = "/";
  static const String loginView = "/loginView";
  static const String registerView = "/registerView";
  static const String onBoardingView = "/onBoardingScreen";

  static Route? getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case mainLayout:
        return CupertinoPageRoute(builder: (context) => MainLayoutView());
      case loginView:
        return CupertinoPageRoute(builder: (context) => LoginView());
      case registerView:
        return CupertinoPageRoute(builder: (context) => RegisterView());
      case onBoardingView:
        return CupertinoPageRoute(builder: (context) => OnBoardingView());
    }
    return null;
  }
}
