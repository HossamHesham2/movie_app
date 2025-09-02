import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/Features/movie/movie_details/data/model/get_movie_detailes_response.dart';
import 'package:movie_app/config/routes/routes_manager.dart';
import 'package:movie_app/core/utils/assets_manager.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';

class CustomMoviePoster extends StatefulWidget {
  final Movie? movie;

  const CustomMoviePoster({super.key, required this.movie});

  @override
  State<CustomMoviePoster> createState() => _CustomMoviePosterState();
}

class _CustomMoviePosterState extends State<CustomMoviePoster> {
  bool isSaved = false;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CachedNetworkImage(
            imageUrl: widget.movie?.largeCoverImage ?? "",
            fit: BoxFit.fill,
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(color: ColorsManager.yellowFB),
            ),
            errorWidget: (context, url, error) => Icon(
              Icons.broken_image,
              color: ColorsManager.yellowFB,
              size: 30.sp,
            ),
          ),
        ),

        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorsManager.black12.withValues(alpha: 0.4),
                  ColorsManager.black12.withValues(alpha: 0.8),
                  ColorsManager.black12,
                ],
              ),
            ),
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pushReplacementNamed(
                      context,
                      RoutesManager.mainLayoutView,
                    ),
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: ColorsManager.white,
                      size: 30.sp,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      setState(() {
                        isSaved = !isSaved;
                      });
                    },
                    icon: SvgPicture.asset(
                      SvgsManager.favIcon,

                      color: isSaved
                          ? ColorsManager.yellowFB
                          : ColorsManager.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 150.h),
              Image.asset(PngManager.play),
              SizedBox(height: 150.h),
              Text(
                widget.movie?.title ?? "",
                style: StyleInterManager.bold24.copyWith(
                  color: ColorsManager.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h),
              Text(
                " ${widget.movie?.year}",
                style: StyleInterManager.bold20.copyWith(
                  color: ColorsManager.greyAD,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
