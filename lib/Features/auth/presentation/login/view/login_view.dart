import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/Features/auth/presentation/login/cubit/login_cubit.dart';
import 'package:movie_app/config/routes/routes_manager.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';
import 'package:movie_app/core/validators/validators_manager.dart';
import 'package:movie_app/Features/auth/presentation/widgets/custom_bottom_auth.dart';
import 'package:movie_app/widgets/custom_elevated_button.dart';
import 'package:movie_app/Features/auth/presentation/widgets/custom_language_toggle.dart';
import 'package:movie_app/Features/auth/presentation/widgets/custom_text_button.dart';
import 'package:movie_app/widgets/custom_text_form_field.dart';
import 'package:movie_app/core/utils/assets_manager.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool obscureTextPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: ColorsManager.black12,
              title: Text(
                context.appLocalizations!.error,
                style: StyleInterManager.bold20.copyWith(color: ColorsManager.white),
              ),
              content: Text(
                state.errMessage,
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
        } else if (state is LoginSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesManager.mainLayoutView,
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  autovalidateMode: LoginCubit.get(context).autoValidateMode,
                  key: LoginCubit.get(context).formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 65.h),
                      Image.asset(PngManager.logo),
                      SizedBox(height: 70.h),
                      // TODO : Email Field
                      CustomTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: LoginCubit.get(context).emailController,
                        prefixIcon: Icon(Icons.email),
                        hint: context.appLocalizations!.email,
                        obscureText: false,
                        validator: (value) => ValidatorsManager.validateEmail(
                          LoginCubit.get(context).emailController.text,
                          context,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      // TODO : Password Field
                      CustomTextFormField(
                        prefixIcon: Icon(Icons.lock),
                        keyboardType: TextInputType.visiblePassword,
                        controller: LoginCubit.get(context).passwordController,
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
                        validator: (value) =>
                            ValidatorsManager.validatePassword(
                              LoginCubit.get(context).passwordController.text,
                              context,
                            ),
                      ),
                      SizedBox(height: 20.h),
                      // TODO : Forget Password Text Button
                      Align(
                        alignment: context.isEnglish
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: CustomTextButton(
                          text: context.appLocalizations!.forget_password,
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              RoutesManager.forgetPasswordView,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10.h),
                      // TODO : Login Button
                      state is LoginLoading
                          ? CircularProgressIndicator(
                              color: ColorsManager.yellowFB,
                            )
                          : CustomElevatedButton(
                              text: context.appLocalizations!.login,
                              backgroundColor: ColorsManager.yellowF6,
                              borderColor: ColorsManager.yellowF6,
                              textColor: ColorsManager.black28,
                              onPressed: () async {
                                final isLoggedIn = await LoginCubit.get(
                                  context,
                                ).login();
                              },
                            ),
                      SizedBox(height: 20.h),
                      // TODO : Register Navigator
                      CustomBottomAuth(
                        title: context.appLocalizations!.dont_have_account,
                        text: context.appLocalizations!.create_one,
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RoutesManager.registerView,
                          );
                        },
                      ),
                      SizedBox(height: 20.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              color: ColorsManager.yellowF6,
                              thickness: 1,
                              indent: 70.w,
                              endIndent: 12.w,
                            ),
                          ),
                          Text(
                            context.appLocalizations!.or,
                            style: StyleInterManager.regular15.copyWith(
                              color: ColorsManager.yellowF6,
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: ColorsManager.yellowF6,
                              thickness: 1,
                              indent: 12.w,
                              endIndent: 70.w,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      // TODO : SignIn With Google Button
                      CustomElevatedButton(
                        text: context.appLocalizations!.login_with_google,
                        prefixWidget: Icon(
                          FontAwesomeIcons.google,
                          color: ColorsManager.black28,
                          size: 25.sp,
                        ),
                        backgroundColor: ColorsManager.yellowF6,
                        borderColor: ColorsManager.yellowF6,
                        textColor: ColorsManager.black28,
                        onPressed: () {},
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
