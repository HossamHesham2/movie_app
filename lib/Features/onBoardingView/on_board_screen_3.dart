import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Features/onBoardingView/on_board_screen_2.dart';
import 'package:movie_app/Features/onBoardingView/on_board_screen_4.dart';
import 'package:movie_app/core/utils/assets_manager.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';
import 'package:movie_app/core/widgets/custom_elevated_button.dart';

class OnBoardScreen3 extends StatefulWidget {
  const OnBoardScreen3({super.key});

  @override
  State<OnBoardScreen3> createState() => _OnBoardScreen3State();
}

class _OnBoardScreen3State extends State<OnBoardScreen3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(PngManager.poster3),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: ColorsManager.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: ColorsManager.black12,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    context.appLocalizations!.poster3_title,
                    style: StyleInterManager.bold24.copyWith(
                      color: ColorsManager.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    context.appLocalizations!.poster3_description,
                    style: StyleInterManager.regular20.copyWith(
                      color: ColorsManager.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),
                  CustomElevatedButton(
                    text: context.appLocalizations!.next,
                    borderColor: ColorsManager.yellowF6,
                    backgroundColor: ColorsManager.yellowF6,
                    textColor: ColorsManager.black28,
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => OnBoardScreen4(),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                  SizedBox(height: 20.h),

                  CustomElevatedButton(
                    text: context.appLocalizations!.back,
                    borderColor: ColorsManager.yellowF6,
                    backgroundColor: ColorsManager.transparent,
                    textColor: ColorsManager.yellowF6,
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => OnBoardScreen2(),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
