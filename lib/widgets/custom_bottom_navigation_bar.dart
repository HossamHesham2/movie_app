import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/assets/assets_manager.dart';
import 'package:movie_app/core/styles/style_manager.dart';
import 'package:movie_app/widgets/custom_icon_bottom_bar.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final void Function(int) callBackFunction;

  const CustomBottomNavigationBar({super.key, required this.callBackFunction});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        width: double.infinity,
        height: 60.h,
        decoration: BoxDecoration(
          color: StyleManager.black28,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = 0;
                });
                widget.callBackFunction(0);
              },
              child: CustomIconBottomBar(
                svg: SvgsManager.homeIcon,
                isSelected: currentIndex == 0,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = 1;
                });
                widget.callBackFunction(1);
              },
              child: CustomIconBottomBar(
                svg: SvgsManager.searchIcon,
                isSelected: currentIndex == 1,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = 2;
                });
                widget.callBackFunction(2);
              },
              child: CustomIconBottomBar(
                svg: SvgsManager.browseIcon,
                isSelected: currentIndex == 2,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = 3;
                });
                widget.callBackFunction(3);
              },
              child: CustomIconBottomBar(
                svg: SvgsManager.profileIcon,
                isSelected: currentIndex == 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
