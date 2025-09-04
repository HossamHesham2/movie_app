import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Features/auth/presentation/login/cubit/login_cubit.dart';
import 'package:movie_app/Features/movie/tabs/profile/presentation/widget/custom_history_list.dart';
import 'package:movie_app/Features/movie/tabs/profile/presentation/widget/custom_tab_bar_text.dart';
import 'package:movie_app/Features/movie/tabs/profile/presentation/widget/custom_watch_list.dart';
import 'package:movie_app/config/routes/routes_manager.dart';
import 'package:movie_app/core/constants/constants_manager.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';
import 'package:movie_app/core/widgets/custom_elevated_button.dart';
import 'package:movie_app/core/widgets/custom_history.dart';
import 'package:movie_app/core/widgets/custom_profile_image.dart';
import 'package:movie_app/Features/auth/presentation/widgets/custom_text_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  User? user;
  int? counterWatchList;
  int? counterHistoryList;
  String? newAvatar;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(color: ColorsManager.black21),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomProfileImage(
                            name: user?.displayName ?? "Guest",
                            imageProfile:
                                user?.photoURL ?? "assets/images/avata1.png",
                          ),
                        ),
                        Expanded(
                          child: CustomHistory(
                            number: (counterWatchList ?? 0).toString(),
                            text: context.appLocalizations!.wish_list,
                          ),
                        ),
                        Expanded(
                          child: CustomHistory(
                            number: (counterHistoryList ?? 0).toString(),
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
                            borderColor: ColorsManager.yellowFB,
                            backgroundColor: ColorsManager.yellowFB,
                            textColor: ColorsManager.black12,
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                RoutesManager.editProfileView,
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: CustomElevatedButton(
                            text: context.appLocalizations!.exit,
                            suffixWidget: Icon(
                              Icons.logout,
                              color: ColorsManager.white,
                            ),
                            borderColor: ColorsManager.redF8,
                            backgroundColor: ColorsManager.redF8,
                            textColor: ColorsManager.white,
                            onPressed: () async {
                              final prefs =
                                  await SharedPreferences.getInstance();

                              await prefs.setBool(
                                ConstantsManager.isLoggedInKey,
                                false,
                              );
                              await prefs.setString(
                                ConstantsManager.tokenKey,
                                "",
                              );

                              // sign out from Firebase
                              await FirebaseAuth.instance.signOut();
                              await LoginCubit.get(context).signOutGoogle();

                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: ColorsManager.black12,
                                  title: Text(
                                    context.appLocalizations!.logout,
                                    style: StyleInterManager.bold20.copyWith(
                                      color: ColorsManager.white,
                                    ),
                                  ),
                                  content: Text(
                                    context
                                        .appLocalizations!
                                        .logout_successfully,
                                    style: StyleInterManager.regular16.copyWith(
                                      color: ColorsManager.white,
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
                      indicatorColor: ColorsManager.yellowFB,
                      dividerColor: ColorsManager.transparent,
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                          width: 4,
                          color: ColorsManager.yellowFB,
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
            Expanded(
              child: TabBarView(
                children: [
                  CustomWatchList(
                    counterWatchList: (count) {
                      setState(() {
                        counterWatchList = count;
                      });
                    },
                  ),
                  CustomHistoryList(
                    counterHistoryList: (count) {
                      setState(() {
                        counterHistoryList = count;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
