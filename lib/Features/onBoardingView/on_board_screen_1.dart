import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Features/onBoardingView/on_board_screen_2.dart';
import 'package:movie_app/core/utils/assets_manager.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';
import 'package:movie_app/widgets/custom_elevated_button.dart';

class OnBoardScreen1 extends StatefulWidget {
  const OnBoardScreen1({super.key});

  @override
  State<OnBoardScreen1> createState() => _OnBoardScreen1State();
}

class _OnBoardScreen1State extends State<OnBoardScreen1> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(PngManager.poster1),
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
                    context.appLocalizations!.poster1_title,
                    style: StyleInterManager.bold24.copyWith(
                      color: ColorsManager.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    context.appLocalizations!.poster1_description,
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
