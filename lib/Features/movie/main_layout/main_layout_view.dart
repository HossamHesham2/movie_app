import 'package:flutter/material.dart';
import 'package:movie_app/Features/movie/tabs/browse/presentation/view/browse_view.dart';
import 'package:movie_app/Features/movie/tabs/home/presentation/home/view/home_view.dart';
import 'package:movie_app/Features/movie/tabs/profile/presentation/view/profile_view.dart';
import 'package:movie_app/Features/movie/tabs/search/presentation/view/search_view.dart';

import 'package:movie_app/core/widgets/custom_bottom_navigation_bar.dart';

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
