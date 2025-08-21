import 'package:flutter/cupertino.dart';
import 'package:movie_app/Features/browse/view/browse_view.dart';
import 'package:movie_app/Features/home/view/home_view.dart';
import 'package:movie_app/Features/login/view/login_view.dart';
import 'package:movie_app/Features/main_layout/main_layout_view.dart';
import 'package:movie_app/Features/onBoardingView/on_boarding_view.dart';
import 'package:movie_app/Features/profile/view/profile_view.dart';
import 'package:movie_app/Features/register/view/register_view.dart';
import 'package:movie_app/Features/search/view/search_view.dart';

class RoutesManager {
  static const String mainLayoutView = "/";
  static const String loginView = "/loginView";
  static const String registerView = "/registerView";
  static const String onBoardingView = "/onBoardingScreen";
  static const String homeView = "/homeView";
  static const String searchView = "/searchView";
  static const String browseView = "/browseView";
  static const String profileView = "/profileView";

  static Route? getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case mainLayoutView:
        return CupertinoPageRoute(builder: (context) => MainLayoutView());
      case loginView:
        return CupertinoPageRoute(builder: (context) => LoginView());
      case registerView:
        return CupertinoPageRoute(builder: (context) => RegisterView());
      case onBoardingView:
        return CupertinoPageRoute(builder: (context) => OnBoardingView());
      case homeView:
        return CupertinoPageRoute(builder: (context) => HomeView());
      case searchView:
        return CupertinoPageRoute(builder: (context) => SearchView());
      case browseView:
        return CupertinoPageRoute(builder: (context) => BrowseView());
      case profileView:
        return CupertinoPageRoute(builder: (context) => ProfileView());
    }
    return null;
  }
}
