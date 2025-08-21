import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/constants_manager.dart';

class CustomListViewAvatars extends StatefulWidget {
  const CustomListViewAvatars({super.key});

  @override
  State<CustomListViewAvatars> createState() => _CustomListViewAvatarsState();
}

class _CustomListViewAvatarsState extends State<CustomListViewAvatars> {
  List<String> avatarsList = ConstantsManager.avatarsList;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 160.h,
        enlargeCenterPage: true,
        viewportFraction: 0.4,
        enableInfiniteScroll: true,
        initialPage: 0,
        enlargeFactor: .35,
        onPageChanged: (index, reason) {
          setState(() {
            currentIndex = index;
            print(currentIndex);
          });
        },
      ),
      itemCount: avatarsList.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return CircleAvatar(
          radius: 70.r,
          child: Image.asset(
            avatarsList[index],
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        );
      },
    );
  }
}
