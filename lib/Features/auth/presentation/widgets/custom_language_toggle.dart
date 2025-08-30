import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/config/language/l10n/cubit/language_cubit.dart';
import 'package:movie_app/core/utils/assets_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/color_managers.dart';

class CustomLanguageToggle extends StatelessWidget {
  const CustomLanguageToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = LanguageCubit.get(context);

    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        bool isEnglish = state.locale == const Locale('en');
        bool isArabic = state.locale == const Locale('ar');

        return Container(
          decoration: BoxDecoration(
            border: Border.all(width: 3, color: ColorsManager.yellowF6),
            borderRadius: BorderRadius.circular(200.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            textDirection: TextDirection.ltr,
            children: [
              _buildFlagButton(
                onTap: () => cubit.changeLanguage(Locale('en')),
                isSelected: isEnglish,
                flagAsset: SvgsManager.usFlag,
              ),
              _buildFlagButton(
                onTap: () => cubit.changeLanguage(Locale('ar')),
                isSelected: isArabic,
                flagAsset: SvgsManager.egFlag,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFlagButton({
    required VoidCallback onTap,
    required bool isSelected,
    required String flagAsset,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5.w),
        decoration: BoxDecoration(
          color: isSelected ? ColorsManager.yellowF6 : ColorsManager.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected
                ? ColorsManager.yellowF6
                : ColorsManager.transparent,
          ),
        ),
        child: SvgPicture.asset(flagAsset, width: 30.w),
      ),
    );
  }
}
