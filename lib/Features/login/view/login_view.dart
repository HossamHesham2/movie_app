import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/config/routes/routes_manager.dart';
import 'package:movie_app/widgets/custom_bottom_auth.dart';
import 'package:movie_app/widgets/custom_elevated_button.dart';
import 'package:movie_app/widgets/custom_language_toggle.dart';
import 'package:movie_app/widgets/custom_text_button.dart';
import 'package:movie_app/widgets/custom_text_form_field.dart';
import 'package:movie_app/core/assets/assets_manager.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';
import 'package:movie_app/core/styles/style_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool obscureTextPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 65.h),
            Image.asset(PngManager.logo),
            SizedBox(height: 70.h),
            // TODO : Email Field
            CustomTextFormField(
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icon(Icons.email),
              hint: context.appLocalizations!.email,
              obscureText: false,
            ),
            SizedBox(height: 20.h),
            // TODO : Password Field
            CustomTextFormField(
              prefixIcon: Icon(Icons.lock),
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureTextPassword = !obscureTextPassword;
                  });
                },
                icon: Icon(
                  obscureTextPassword ? Icons.visibility : Icons.visibility_off,
                ),
              ),
              hint: context.appLocalizations!.password,
              obscureText: obscureTextPassword,
            ),
            SizedBox(height: 20.h),
            // TODO : Forget Password Text Button
            Align(
              alignment: context.isEnglish
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: CustomTextButton(
                text: context.appLocalizations!.forget_password,
                onPressed: () {},
              ),
            ),
            SizedBox(height: 10.h),
            // TODO : Login Button
            CustomElevatedButton(
              text: context.appLocalizations!.login,
              backgroundColor: StyleManager.yellowF6,
              borderColor: StyleManager.yellowF6,
              textColor: StyleManager.black28,
              onPressed: () {},
            ),
            SizedBox(height: 20.h),
            // TODO : Register Navigator
            CustomBottomAuth(
              title: context.appLocalizations!.dont_have_account,
              text: context.appLocalizations!.create_one,
              onPressed: () {
                print("object");
                Navigator.pushNamed(context, RoutesManager.registerView);
              },
            ),
            SizedBox(height: 20.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color: StyleManager.yellowF6,
                    thickness: 1,
                    indent: 70.w,
                    endIndent: 12.w,
                  ),
                ),
                Text(
                  context.appLocalizations!.or,
                  style: StyleManager.regular15.copyWith(
                    color: StyleManager.yellowF6,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: StyleManager.yellowF6,
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
              widget: Icon(
                FontAwesomeIcons.google,
                color: StyleManager.black28,
                size: 25.sp,
              ),
              backgroundColor: StyleManager.yellowF6,
              borderColor: StyleManager.yellowF6,
              textColor: StyleManager.black28,
              onPressed: () {},
            ),
            SizedBox(height: 20.h),
            // TODO : Language Toggle
            CustomLanguageToggle(),
          ],
        ),
      ),
    );
  }
}
