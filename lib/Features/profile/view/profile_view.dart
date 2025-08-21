import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/routes/routes_manager.dart';
import 'package:movie_app/core/assets/assets_manager.dart';
import 'package:movie_app/core/constants/constants_manager.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';
import 'package:movie_app/core/styles/style_manager.dart';
import 'package:movie_app/widgets/custom_elevated_button.dart';
import 'package:movie_app/widgets/custom_history.dart';
import 'package:movie_app/widgets/custom_profile_image.dart';
import 'package:movie_app/widgets/custom_text_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final user = FirebaseAuth.instance.currentUser;

  // Name, email address, and profile photo URL
  late final name = user?.displayName ?? "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(color: StyleManager.black21),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomProfileImage(
                        name: name,
                        imageProfile: PngManager.avatar1,
                      ),
                      Expanded(
                        child: CustomHistory(
                          number: "10",
                          text: context.appLocalizations!.wish_list,
                        ),
                      ),
                      Expanded(
                        child: CustomHistory(
                          number: "10",
                          text: context.appLocalizations!.history,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomElevatedButton(
                          text: context.appLocalizations!.edit_profile,
                          borderColor: StyleManager.yellowFB,
                          backgroundColor: StyleManager.yellowFB,
                          textColor: StyleManager.black12,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: CustomElevatedButton(
                          text: context.appLocalizations!.exit,
                          suffixWidget: Icon(
                            Icons.logout,
                            color: StyleManager.white,
                          ),
                          borderColor: StyleManager.redF8,
                          backgroundColor: StyleManager.redF8,
                          textColor: StyleManager.white,
                          onPressed: () async {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setBool(
                              ConstantsManager.ISLOGGEDIN_KEY,
                              false,
                            );
                            await FirebaseAuth.instance.signOut();
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                backgroundColor: StyleManager.black12,
                                title: Text(
                                  context.appLocalizations!.logout,
                                  style: StyleManager.bold20.copyWith(
                                    color: StyleManager.white,
                                  ),
                                ),
                                content: Text(
                                  context.appLocalizations!.logout_successfully,
                                  style: StyleManager.regular16.copyWith(
                                    color: StyleManager.white,
                                  ),
                                ),
                                actions: [
                                  CustomTextButton(
                                    text: context.appLocalizations!.ok,
                                    onPressed: () =>
                                        Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          RoutesManager.loginView,
                                          (route) => false,
                                        ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
