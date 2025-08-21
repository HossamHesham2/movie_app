import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Features/onBoardingView/on_board_screen_1.dart';
import 'package:movie_app/Features/onBoardingView/on_board_screen_3.dart';
import 'package:movie_app/core/assets/assets_manager.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';
import 'package:movie_app/core/styles/style_manager.dart';
import 'package:movie_app/widgets/custom_elevated_button.dart';

class OnBoardScreen2 extends StatefulWidget {
  const OnBoardScreen2({super.key});

  @override
  State<OnBoardScreen2> createState() => _OnBoardScreen2State();
}

class _OnBoardScreen2State extends State<OnBoardScreen2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(PngManager.poster2),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: StyleManager.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: StyleManager.black12,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    context.appLocalizations!.poster2_title,
                    style: StyleManager.bold24.copyWith(
                      color: StyleManager.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    context.appLocalizations!.poster2_description,
                    style: StyleManager.regular20.copyWith(
                      color: StyleManager.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),
                  CustomElevatedButton(
                    text: context.appLocalizations!.next,
                    borderColor: StyleManager.yellowF6,
                    backgroundColor: StyleManager.yellowF6,
                    textColor: StyleManager.black28,
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => OnBoardScreen3(),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                  SizedBox(height: 20.h),

                  CustomElevatedButton(
                    text: context.appLocalizations!.back,
                    borderColor: StyleManager.yellowF6,
                    backgroundColor: StyleManager.transparent,
                    textColor: StyleManager.yellowF6,
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
