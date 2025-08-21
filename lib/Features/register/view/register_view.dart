import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/core/validators/validators_manager.dart';
import 'package:movie_app/widgets/custom_bottom_auth.dart';
import 'package:movie_app/widgets/custom_elevated_button.dart';
import 'package:movie_app/widgets/custom_language_toggle.dart';
import 'package:movie_app/widgets/custom_list_view_avatars.dart';
import 'package:movie_app/widgets/custom_text_form_field.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';
import 'package:movie_app/core/styles/style_manager.dart';

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
    return Scaffold(
      appBar: CustomAppBar(
        title: context.appLocalizations!.register,
        onBack: () => Navigator.pop(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10.h),
            CustomListViewAvatars(),
            SizedBox(height: 20.h),
            // TODO: Name Field
            CustomTextFormField(
              prefixIcon: Icon(FontAwesomeIcons.idCard),
              hint: context.appLocalizations!.name,
              obscureText: false,
              keyboardType: TextInputType.name,
              validator: (value) =>
                  ValidatorsManager.validateName("value", context),
            ),
            SizedBox(height: 20.h),
            // TODO: Email Field
            CustomTextFormField(
              prefixIcon: Icon(Icons.email),
              hint: context.appLocalizations!.email,
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              validator: (value) =>
                  ValidatorsManager.validateEmail("value", context),
            ),
            SizedBox(height: 20.h),
            // TODO: Password Field
            CustomTextFormField(
              prefixIcon: Icon(Icons.lock),
              keyboardType: TextInputType.visiblePassword,
              validator: (value) =>
                  ValidatorsManager.validatePassword("value", context),
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
            // TODO: Confirm Password Field
            CustomTextFormField(
              prefixIcon: Icon(Icons.lock),
              keyboardType: TextInputType.visiblePassword,
              validator: (value) => ValidatorsManager.validateConfirmPassword(
                "confirmPassword",
                "password",
                context,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureTextConfirmPassword = !obscureTextConfirmPassword;
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
              prefixIcon: Icon(FontAwesomeIcons.idCard),
              keyboardType: TextInputType.phone,
              hint: context.appLocalizations!.name,
              obscureText: false,
              validator: (value) =>
                  ValidatorsManager.validatePhone("phone", context),
            ),
            SizedBox(height: 20.h),
            // TODO: Register Button
            CustomElevatedButton(
              text: context.appLocalizations!.create_account,
              backgroundColor: StyleManager.yellowF6,
              borderColor: StyleManager.yellowF6,
              textColor: StyleManager.black28,
              onPressed: () {},
            ),
            SizedBox(height: 20.h),
            // TODO : Login Navigator
            CustomBottomAuth(
              title: context.appLocalizations!.dont_have_account,
              text: context.appLocalizations!.login,
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

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBack;

  const CustomAppBar({Key? key, required this.title, required this.onBack})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: StyleManager.transparent,
      foregroundColor: StyleManager.yellowF6,
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
