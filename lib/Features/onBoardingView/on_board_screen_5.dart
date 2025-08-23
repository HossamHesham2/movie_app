import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Features/onBoardingView/on_board_screen_4.dart';
import 'package:movie_app/config/routes/routes_manager.dart';
import 'package:movie_app/core/assets/assets_manager.dart';
import 'package:movie_app/core/constants/constants_manager.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';
import 'package:movie_app/core/styles/style_manager.dart';
import 'package:movie_app/widgets/custom_elevated_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardScreen5 extends StatefulWidget {
  const OnBoardScreen5({super.key});

  @override
  State<OnBoardScreen5> createState() => _OnBoardScreen5State();
}

class _OnBoardScreen5State extends State<OnBoardScreen5> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(PngManager.poster5),
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
                    context.appLocalizations!.poster5_title,
                    style: StyleManager.bold24.copyWith(
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
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool(ConstantsManager.isSeenKey, true);
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RoutesManager.loginView,
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
                          builder: (context) => OnBoardScreen4(),
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
