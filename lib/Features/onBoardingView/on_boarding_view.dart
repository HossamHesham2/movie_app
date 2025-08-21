import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Features/onBoardingView/on_board_screen_1.dart';
import 'package:movie_app/core/assets/assets_manager.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';
import 'package:movie_app/core/styles/style_manager.dart';
import 'package:movie_app/widgets/custom_elevated_button.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(PngManager.mainPoster),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: StyleManager.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  context.appLocalizations!.find_next_favorite_movie,
                  style: StyleManager.bold36.copyWith(
                    color: StyleManager.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                Text(
                  context.appLocalizations!.movie_library_description,
                  style: StyleManager.regular20.copyWith(
                    color: StyleManager.white.withValues(alpha: 0.5),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
                CustomElevatedButton(
                  text: context.appLocalizations!.explore_now,
                  borderColor: StyleManager.yellowF6,
                  backgroundColor: StyleManager.yellowF6,
                  textColor: StyleManager.black28,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => OnBoardScreen1(),
                      ),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
