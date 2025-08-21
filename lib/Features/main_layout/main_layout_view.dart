import 'package:flutter/material.dart';
import 'package:movie_app/Features/browse/view/browse_view.dart';
import 'package:movie_app/Features/home/view/home_view.dart';
import 'package:movie_app/Features/profile/view/profile_view.dart';
import 'package:movie_app/Features/search/view/search_view.dart';
import 'package:movie_app/widgets/custom_bottom_navigation_bar.dart';

class MainLayoutView extends StatefulWidget {
  const MainLayoutView({super.key});

  @override
  State<MainLayoutView> createState() => _MainLayoutViewState();
}

class _MainLayoutViewState extends State<MainLayoutView> {
  List<Widget> tabs = [HomeView(), SearchView(), BrowseView(), ProfileView()];
  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        callBackFunction: (index) {
          setState(() {
            currentIndex = index;
            print(currentIndex);
          });
        },
      ),
      body: tabs[currentIndex],
    );
  }
}
