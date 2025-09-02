import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Features/auth/presentation/widgets/custom_text_button.dart';
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
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        if (state is DeleteProfileSuccess) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: ColorsManager.black12,
              title: Text(
                context.appLocalizations!.error,
                style: StyleInterManager.bold20.copyWith(
                  color: ColorsManager.white,
                ),
              ),
              content: Text(
                "Account Deleted",
                style: StyleInterManager.regular16.copyWith(
                  color: ColorsManager.white,
                ),
              ),
              actions: [
                CustomTextButton(
                  text: context.appLocalizations!.ok,
                  onPressed: () => Navigator.pushReplacementNamed(
                    context,
                    RoutesManager.loginView,
                  ),
                ),
              ],
            ),
          );
        }
        return Scaffold(
          appBar: CustomEditProfileAppBar(),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: EditProfileCubit.get(context).formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  Spacer(),
                  SizedBox(height: 20.h),
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
                            EditProfileCubit.get(context).deleteAccount();
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
