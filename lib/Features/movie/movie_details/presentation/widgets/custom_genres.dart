import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Features/movie/movie_details/data/model/get_movie_details_response.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';

class CustomGenres extends StatelessWidget {
  final Movie? movie;

  const CustomGenres({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.appLocalizations!.genres,
          style: StyleInterManager.bold24.copyWith(color: ColorsManager.white),
        ),
        SizedBox(height: 20.h),
        Wrap(
          spacing: 20,
          runSpacing: 15.h,
          children: movie!.genres!.map((genres) {
            return Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: ColorsManager.black28,
              ),
              child: Text(
                genres,
                style: StyleInterManager.regular16.copyWith(
                  color: ColorsManager.white,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
