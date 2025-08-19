import 'package:flutter/cupertino.dart';
import 'package:movie_app/Views/main_layout/main_layout_view.dart';

class RoutesManager {
  static const String mainLayout = "/";

  static Route? getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case mainLayout:
        return CupertinoPageRoute(builder: (context) => MainLayoutView());
    }
    return null;
  }
}
