import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Features/movie/movie_details/data/model/get_movie_details_response.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';

class CustomScreenShots extends StatelessWidget {
  final Movie? movie;

  const CustomScreenShots({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),

        Text(
          context.appLocalizations!.screen_shots,
          style: StyleInterManager.bold24.copyWith(color: ColorsManager.white),
        ),
        SizedBox(height: 20.h),
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16.r),
          child: CachedNetworkImage(
            imageUrl: movie?.backgroundImage ?? "",
            fit: BoxFit.fill,
            height: 170.h,
            width: double.infinity,
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(color: ColorsManager.yellowFB),
            ),
            errorWidget: (context, url, error) => Icon(
              Icons.broken_image,
              color: ColorsManager.yellowFB,
              size: 30.sp,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16.r),
          child: CachedNetworkImage(
            imageUrl: movie?.backgroundImageOriginal
                ?? "",
            fit: BoxFit.fill,
            height: 170.h,
            width: double.infinity,
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(color: ColorsManager.yellowFB),
            ),
            errorWidget: (context, url, error) => Icon(
              Icons.broken_image,
              color: ColorsManager.yellowFB,
              size: 30.sp,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16.r),
          child: CachedNetworkImage(
            imageUrl: movie?.backgroundImageOriginal ?? "",
            fit: BoxFit.fill,
            height: 170.h,
            width: double.infinity,
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(color: ColorsManager.yellowFB),
            ),
            errorWidget: (context, url, error) => Icon(
              Icons.broken_image,
              color: ColorsManager.yellowFB,
              size: 30.sp,
            ),
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
