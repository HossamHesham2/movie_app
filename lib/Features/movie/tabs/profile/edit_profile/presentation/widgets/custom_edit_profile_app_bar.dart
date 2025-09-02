import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';

class CustomEditProfileAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomEditProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManager.transparent,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Icons.arrow_back_sharp,
          color: ColorsManager.yellowFB,
          size: 30.sp,
        ),
      ),
      centerTitle: true,
      title: Text(
        context.appLocalizations!.pick_avatar,
        style: StyleInterManager.regular16.copyWith(
          color: ColorsManager.yellowF6,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40.h);
}
