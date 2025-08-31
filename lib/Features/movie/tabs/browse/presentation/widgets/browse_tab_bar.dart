import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';

class BrowseTabBar extends StatefulWidget {
  final List<String>? genres;
  final void Function(int)? onTap;

  const BrowseTabBar({super.key, this.genres, this.onTap});

  @override
  State<BrowseTabBar> createState() => _BrowseTabBarState();
}

class _BrowseTabBarState extends State<BrowseTabBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      dividerColor: ColorsManager.transparent,
      indicatorColor: ColorsManager.black12,
      labelColor: ColorsManager.yellowF6,
      unselectedLabelColor: ColorsManager.yellowF6,
      onTap: (value) {
        setState(() {
          currentIndex = value;
        });
        widget.onTap?.call(value);
      },
      tabs: List.generate(widget.genres?.length ?? 0, (index) {
        final genre = widget.genres![index];
        final isSelected = currentIndex == index;

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: isSelected
                ? ColorsManager.yellowF6
                : ColorsManager.transparent,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: ColorsManager.yellowF6,width: 2.w),
          ),
          child: Text(
            genre,
            style: StyleInterManager.bold20.copyWith(
              color: isSelected
                  ? ColorsManager.black28
                  : ColorsManager.yellowF6,
            ),
          ),
        );
      }),
    );
  }
}
