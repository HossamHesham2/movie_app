import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Features/auth/data/repositories/auth_repository_impl.dart';
import 'package:movie_app/Features/auth/presentation/forget_password/cubit/forget_password_cubit.dart';
import 'package:movie_app/Features/auth/presentation/widgets/custom_text_button.dart';
import 'package:movie_app/config/routes/routes_manager.dart';
import 'package:movie_app/core/utils/assets_manager.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';
import 'package:movie_app/core/validators/validators_manager.dart';
import 'package:movie_app/core/widgets/custom_elevated_button.dart';
import 'package:movie_app/core/widgets/custom_text_form_field.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: context.appLocalizations!.forget_password,
        onBack: () => Navigator.pop(context),
      ),
      body: BlocProvider<ForgetPasswordCubit>(
        create: (context) => ForgetPasswordCubit(AuthRepositoryImpl()),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if (state is ForgetPasswordFailure) {
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
              } else if (state is ForgetPasswordSuccess) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: ColorsManager.black12,
                    title: Text(
                      context.appLocalizations!.forget_password,
                      style: StyleInterManager.bold20.copyWith(
                        color: ColorsManager.white,
                      ),
                    ),
                    content: Text(
                      context.appLocalizations!.sent_mail,
                      style: StyleInterManager.regular16.copyWith(
                        color: ColorsManager.white,
                      ),
                    ),
                    actions: [
                      CustomTextButton(
                        text: context.appLocalizations!.ok,
                        onPressed: () => Navigator.pushNamedAndRemoveUntil(
                          context,
                          RoutesManager.loginView,
                          (route) => false,
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
            builder: (context, state) {
              return Form(
                key: ForgetPasswordCubit.get(context).formKey,
                autovalidateMode: ForgetPasswordCubit.get(
                  context,
                ).autoValidateMode,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        PngManager.forgetPasswordBg,
                        width: double.infinity,
                      ),
                      CustomTextFormField(
                        prefixIcon: Icon(Icons.email),
                        hint: context.appLocalizations!.email,
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        controller: ForgetPasswordCubit.get(
                          context,
                        ).emailController,
                        validator: (_) => ValidatorsManager.validateEmail(
                          ForgetPasswordCubit.get(
                            context,
                          ).emailController.text.trim(),
                          context,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      state is ForgetPasswordLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: ColorsManager.yellowFB,
                              ),
                            )
                          : CustomElevatedButton(
                              onPressed: () async {
                                await ForgetPasswordCubit.get(
                                  context,
                                ).forgetPassword();
                              },
                              text: context.appLocalizations!.verify_email,
                              borderColor: ColorsManager.yellowF6,
                              backgroundColor: ColorsManager.yellowF6,
                              textColor: ColorsManager.black12,
                            ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
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
