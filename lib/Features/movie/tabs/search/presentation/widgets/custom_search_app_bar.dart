import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';
import 'package:movie_app/core/utils/assets_manager.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/widgets/custom_text_form_field.dart';

class CustomSearchAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final void Function(String)? onChanged;

  const CustomSearchAppBar({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManager.transparent,

      title: CustomTextFormField(
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 10.h),
          child: SvgPicture.asset(SvgsManager.searchIcon, fit: BoxFit.fill),
        ),
        hint: context.appLocalizations!.search,
        obscureText: false,
        onChanged: onChanged,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
