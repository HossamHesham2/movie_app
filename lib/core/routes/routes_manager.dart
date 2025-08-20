import 'package:flutter/cupertino.dart';
import 'package:movie_app/Views/login_view/login_view.dart';
import 'package:movie_app/Views/main_layout/main_layout_view.dart';

class RoutesManager {
  static const String mainLayout = "/";
  static const String loginView = "/loginView";

  static Route? getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case mainLayout:
        return CupertinoPageRoute(builder: (context) => MainLayoutView());
      case loginView:
        return CupertinoPageRoute(builder: (context) => LoginView());
    }
    return null;
  }
}
