import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Features/movie/profile/presentation/widget/custom_tab_bar_text.dart';
import 'package:movie_app/config/routes/routes_manager.dart';
import 'package:movie_app/core/constants/constants_manager.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';
import 'package:movie_app/core/styles/style_manager.dart';
import 'package:movie_app/widgets/custom_elevated_button.dart';
import 'package:movie_app/widgets/custom_history.dart';
import 'package:movie_app/widgets/custom_profile_image.dart';
import 'package:movie_app/Features/auth/presentation/widgets/custom_text_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
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
                          name: user?.displayName ?? "Guest",
                          imageProfile:
                              user?.photoURL ?? "assets/images/avata1.png",
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
                              final prefs =
                                  await SharedPreferences.getInstance();

                              await prefs.setBool(
                                ConstantsManager.isLoggedInKey,
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
                                    context
                                        .appLocalizations!
                                        .logout_successfully,
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
                    SizedBox(height: 15.h),
                    TabBar(
                      indicatorColor: StyleManager.yellowFB,
                      dividerColor: StyleManager.transparent,
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                          width: 4,
                          color: StyleManager.yellowFB,
                        ),
                        insets: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width / 2.88,
                        ),
                      ),
                      tabs: [
                        CustomTabBarText(
                          icon: Icons.menu,
                          text: context.appLocalizations!.wish_list,
                        ),
                        CustomTabBarText(
                          icon: Icons.folder,
                          text: context.appLocalizations!.history,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
