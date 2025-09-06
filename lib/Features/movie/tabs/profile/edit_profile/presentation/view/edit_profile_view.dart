import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Features/movie/tabs/profile/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:movie_app/Features/movie/tabs/profile/edit_profile/presentation/widgets/custom_edit_profile_app_bar.dart';
import 'package:movie_app/Features/movie/tabs/profile/edit_profile/presentation/widgets/custom_pick_avatars.dart';
import 'package:movie_app/config/routes/routes_manager.dart';
import 'package:movie_app/core/constants/constants_manager.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';
import 'package:movie_app/core/validators/validators_manager.dart';
import 'package:movie_app/core/widgets/custom_elevated_button.dart';
import 'package:movie_app/core/widgets/custom_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  User? user;

  String? newAvatar;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is DeleteProfileSuccess) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              backgroundColor: ColorsManager.black28,

              title: Text(
                "Success",
                style: StyleInterManager.regular20.copyWith(
                  color: ColorsManager.yellowF6,
                ),
              ),
              content: Text(
                "Account deleted successfully ✅",
                style: StyleInterManager.bold20.copyWith(
                  color: ColorsManager.yellowF6,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RoutesManager.loginView,
                      (route) => false,
                    );
                  },
                  child: Text(
                    context.appLocalizations!.ok,
                    style: StyleInterManager.regular20.copyWith(
                      color: ColorsManager.yellowF6,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is DeleteProfileFailure) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              backgroundColor: ColorsManager.black28,
              title: Text(
                context.appLocalizations!.error,
                style: StyleInterManager.regular20.copyWith(
                  color: ColorsManager.yellowF6,
                ),
              ),
              content: Text(
                state.errorMessage,
                style: StyleInterManager.bold20.copyWith(
                  color: ColorsManager.yellowF6,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    RoutesManager.loginView,
                    (route) => false,
                  ),
                  child: Text(
                    context.appLocalizations!.ok,
                    style: StyleInterManager.regular20.copyWith(
                      color: ColorsManager.yellowF6,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomEditProfileAppBar(),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: EditProfileCubit.get(context).formKey,
              child: ListView(
                children: [
                  SizedBox(height: 20.h),
                  CustomPickAvatars(
                    avatarPicked: (avatarPicked) {
                      setState(() {
                        newAvatar = avatarPicked;
                      });
                    },
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFormField(
                    prefixIcon: Icon(Icons.person),
                    hint: context.appLocalizations!.name,
                    obscureText: false,
                    controller: EditProfileCubit.get(context).nameController,
                    validator: (_) => ValidatorsManager.validateName(
                      EditProfileCubit.get(context).nameController.text,
                      context,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFormField(
                    prefixIcon: Icon(Icons.phone),
                    hint: context.appLocalizations!.phone_number,
                    obscureText: false,
                    controller: EditProfileCubit.get(context).phoneController,
                    validator: (_) => ValidatorsManager.validateName(
                      EditProfileCubit.get(context).phoneController.text,
                      context,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        RoutesManager.forgetPasswordView,
                      ),
                      child: Text(
                        context.appLocalizations!.reset_password,
                        style: StyleInterManager.regular16.copyWith(
                          color: ColorsManager.white,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 40.h),
                  state is DeleteProfileLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: ColorsManager.yellowF6,
                          ),
                        )
                      : CustomElevatedButton(
                          text: context.appLocalizations!.delete_account,
                          borderColor: ColorsManager.redF8,
                          backgroundColor: ColorsManager.redF8,
                          textColor: ColorsManager.white,
                          onPressed: () async {
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setString(ConstantsManager.tokenKey, "");
                            prefs.setBool(
                              ConstantsManager.isLoggedInKey,
                              false,
                            );
                            await EditProfileCubit.get(context).deleteAccount();

                          },
                        ),
                  SizedBox(height: 20.h),
                  state is EditProfileLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: ColorsManager.yellowF6,
                          ),
                        )
                      : CustomElevatedButton(
                          text: context.appLocalizations!.update_data,
                          borderColor: ColorsManager.yellowF6,
                          backgroundColor: ColorsManager.yellowF6,
                          textColor: ColorsManager.white,
                          onPressed: () {
                            EditProfileCubit.get(context)
                                .editProfile(profileImage: newAvatar)
                                .then(
                                  (value) => Navigator.pushReplacementNamed(
                                    context,
                                    RoutesManager.mainLayoutView,
                                  ),
                                );
                          },
                        ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
