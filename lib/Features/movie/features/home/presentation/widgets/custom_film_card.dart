import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/styles/style_manager.dart';

class CustomFilmCard extends StatelessWidget {
  final String posterImage;

  final double rate;

  const CustomFilmCard({
    super.key,
    required this.posterImage,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(40.r),
            child: CachedNetworkImage(
              imageUrl: posterImage,

              width: 230.w,
              height: 350.h,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(color: StyleManager.yellowFB),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),

          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: StyleManager.black28.withValues(alpha: 0.5),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${rate}",
                  style: StyleManager.regular16.copyWith(
                    color: StyleManager.white,
                  ),
                ),
                SizedBox(width: 2.w),
                Icon(Icons.star, color: StyleManager.yellowFB),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
