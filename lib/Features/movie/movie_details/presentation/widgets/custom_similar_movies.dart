import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';

class CustomSimilarMovies extends StatelessWidget {
  const CustomSimilarMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.appLocalizations!.similar,
          style: StyleInterManager.bold24.copyWith(color: ColorsManager.white),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
