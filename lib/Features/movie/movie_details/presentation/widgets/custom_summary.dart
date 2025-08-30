import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Features/movie/movie_details/data/model/get_movie_detailes_response.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';

class CustomSummary extends StatelessWidget {
  final Movie? movie;

  const CustomSummary({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.appLocalizations!.summary,
          style: StyleInterManager.bold24.copyWith(color: ColorsManager.white),
        ),
        SizedBox(height: 20.h),
        Text(
          movie?.descriptionFull ?? "",
          style: StyleInterManager.regular16.copyWith(
            color: ColorsManager.white,
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
