import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Features/movie/movie_details/data/model/get_movie_details_response.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';

class CustomMovieCastes extends StatelessWidget {
  final Movie? movie;

  const CustomMovieCastes({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.appLocalizations!.cast,
          style: StyleInterManager.bold24.copyWith(color: ColorsManager.white),
        ),
        SizedBox(height: 20.h),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ColorsManager.black28,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: ListTile(
            minVerticalPadding: 0,
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Name : Hayley Atwell ",
              style: StyleInterManager.regular20.copyWith(
                color: ColorsManager.white,
              ),
            ),
            subtitle: Text(
              "Character : Captain Carter",
              style: StyleInterManager.regular20.copyWith(
                color: ColorsManager.white,
              ),
            ),
            leading: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10.r),
              child: Image.asset("assets/images/case1.png", fit: BoxFit.fill),
            ),
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
