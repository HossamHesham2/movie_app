import 'package:flutter/material.dart';
import 'package:movie_app/Features/movie/Features/browse/view/browse_view.dart';
import 'package:movie_app/Features/movie/Features/home/presentation/view/home_view.dart';
import 'package:movie_app/Features/movie/Features/profile/presentation/view/profile_view.dart';
import 'package:movie_app/Features/movie/Features/search/view/search_view.dart';
import 'package:movie_app/core/styles/style_manager.dart';
import 'package:movie_app/widgets/custom_bottom_navigation_bar.dart';

class MainLayoutView extends StatefulWidget {
  const MainLayoutView({super.key});

  @override
  State<MainLayoutView> createState() => _MainLayoutViewState();
}

class _MainLayoutViewState extends State<MainLayoutView> {
  final List<Widget> tabs = [
    HomeView(),
    SearchView(),
    BrowseView(),
    ProfileView(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    print("new Screen");
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        callBackFunction: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: tabs[currentIndex],
    );
  }
}
