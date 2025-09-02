import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Features/auth/presentation/register/cubit/register_cubit.dart';
import 'package:movie_app/core/constants/constants_manager.dart';
import 'package:movie_app/core/utils/assets_manager.dart';
import 'package:movie_app/core/utils/color_managers.dart';

class CustomPickAvatars extends StatefulWidget {
  final void Function(String?)? avatarPicked;

  const CustomPickAvatars({super.key, this.avatarPicked});

  @override
  State<CustomPickAvatars> createState() => _CustomPickAvatarsState();
}

class _CustomPickAvatarsState extends State<CustomPickAvatars> {
  List<String> avatarsList = ConstantsManager.avatarsList;
  int currentIndex = 0;
  String? avatar;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  decoration: BoxDecoration(
                    color: ColorsManager.black12,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10.h,
                      crossAxisSpacing: 10.w,
                    ),
                    itemCount: ConstantsManager.avatarsList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          print(ConstantsManager.avatarsList[index]);
                          setState(() {
                            currentIndex = index;
                            avatar = ConstantsManager.avatarsList[index];
                          });
                          widget.avatarPicked!.call(
                            ConstantsManager.avatarsList[index],
                          );
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: currentIndex == index
                                ? ColorsManager.yellowF6
                                : ColorsManager.transparent,
                            border: Border.all(
                              color: ColorsManager.yellowF6,
                              width: 2.w,
                            ),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: CircleAvatar(
                            radius: 70.r,
                            child: Image.asset(
                              ConstantsManager.avatarsList[index],
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
          child: CircleAvatar(
            radius: 70.r,
            child: Image.asset(
              avatar ?? PngManager.avatar1,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        );
      },
    );
  }
}
