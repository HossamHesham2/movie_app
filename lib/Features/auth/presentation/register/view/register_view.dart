import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/Features/auth/presentation/register/cubit/register_cubit.dart';
import 'package:movie_app/config/routes/routes_manager.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';
import 'package:movie_app/core/validators/validators_manager.dart';
import 'package:movie_app/Features/auth/presentation/widgets/custom_bottom_auth.dart';
import 'package:movie_app/widgets/custom_elevated_button.dart';
import 'package:movie_app/Features/auth/presentation/widgets/custom_language_toggle.dart';
import 'package:movie_app/Features/auth/presentation/widgets/custom_list_view_avatars.dart';
import 'package:movie_app/Features/auth/presentation/widgets/custom_text_button.dart';
import 'package:movie_app/widgets/custom_text_form_field.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool obscureTextPassword = true;
  bool obscureTextConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailure) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: ColorsManager.black12,
              title: Text(
                context.appLocalizations!.error,
                style: StyleInterManager.bold20.copyWith(color: ColorsManager.white),
              ),
              content: Text(
                state.errorMessage,
                style: StyleInterManager.regular16.copyWith(
                  color: ColorsManager.white,
                ),
              ),
              actions: [
                CustomTextButton(
                  text: context.appLocalizations!.ok,
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          );
        } else if (state is RegisterSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesManager.loginView,
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        final registerCubit = RegisterCubit.get(context);
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: CustomAppBar(
              title: context.appLocalizations!.register,
              onBack: () => Navigator.pop(context),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: registerCubit.formKey,
                  autovalidateMode: registerCubit.autoValidateMode,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10.h),
                      CustomListViewAvatars(),
                      SizedBox(height: 20.h),
                      // TODO: Name Field
                      CustomTextFormField(
                        prefixIcon: Icon(FontAwesomeIcons.idCard),
                        controller: registerCubit.nameController,
                        hint: context.appLocalizations!.name,
                        obscureText: false,
                        keyboardType: TextInputType.name,
                        validator: (value) => ValidatorsManager.validateName(
                          registerCubit.nameController.text,
                          context,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      // TODO: Email Field
                      CustomTextFormField(
                        prefixIcon: Icon(Icons.email),
                        controller: registerCubit.emailController,
                        hint: context.appLocalizations!.email,
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => ValidatorsManager.validateEmail(
                          registerCubit.emailController.text,
                          context,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      // TODO: Password Field
                      CustomTextFormField(
                        prefixIcon: Icon(Icons.lock),
                        controller: registerCubit.passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) =>
                            ValidatorsManager.validatePassword(
                              registerCubit.passwordController.text,
                              context,
                            ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureTextPassword = !obscureTextPassword;
                            });
                          },
                          icon: Icon(
                            obscureTextPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        hint: context.appLocalizations!.password,
                        obscureText: obscureTextPassword,
                      ),
                      SizedBox(height: 20.h),
                      // TODO: Confirm Password Field
                      CustomTextFormField(
                        prefixIcon: Icon(Icons.lock),
                        keyboardType: TextInputType.visiblePassword,
                        controller: registerCubit.confirmPasswordController,
                        validator: (value) =>
                            ValidatorsManager.validateConfirmPassword(
                              registerCubit.confirmPasswordController.text,
                              registerCubit.passwordController.text,
                              context,
                            ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureTextConfirmPassword =
                                  !obscureTextConfirmPassword;
                            });
                          },
                          icon: Icon(
                            obscureTextConfirmPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        hint: context.appLocalizations!.confirm_password,
                        obscureText: obscureTextConfirmPassword,
                      ),
                      SizedBox(height: 20.h),
                      // TODO: Phone Field
                      CustomTextFormField(
                        prefixIcon: Icon(FontAwesomeIcons.phone),
                        keyboardType: TextInputType.phone,
                        controller: registerCubit.phoneController,
                        hint: context.appLocalizations!.phone_number,
                        obscureText: false,
                        validator: (value) => ValidatorsManager.validatePhone(
                          registerCubit.phoneController.text,
                          context,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      // TODO: Register Button
                      state is RegisterLoading
                          ? CircularProgressIndicator(
                              color: ColorsManager.yellowFB,
                            )
                          : CustomElevatedButton(
                              text: context.appLocalizations!.create_account,
                              backgroundColor: ColorsManager.yellowF6,
                              borderColor: ColorsManager.yellowF6,
                              textColor: ColorsManager.black28,
                              onPressed: () async {
                                final isRegistered = await registerCubit
                                    .register();
                              },
                            ),
                      SizedBox(height: 20.h),
                      // TODO : Login Navigator
                      CustomBottomAuth(
                        title: context.appLocalizations!.dont_have_account,
                        text: context.appLocalizations!.login,
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            RoutesManager.loginView,
                            (route) => false,
                          );
                        },
                      ),
                      SizedBox(height: 20.h),
                      // TODO : Language Toggle
                      CustomLanguageToggle(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBack;

  const CustomAppBar({super.key, required this.title, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManager.transparent,
      foregroundColor: ColorsManager.yellowF6,
      title: Text(title),
      centerTitle: true,
      leading: IconButton(
        onPressed: onBack,
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
