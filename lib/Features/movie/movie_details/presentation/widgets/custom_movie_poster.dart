import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/Features/movie/movie_details/data/model/get_movie_details_response.dart';
import 'package:movie_app/Features/movie/movie_details/presentation/cubit/movie_details_cubit.dart';
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
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    if (widget.movie != null) {
      MovieDetailsCubit.get(context).checkWatchlist(movieId: widget.movie!.id);
    }
  }

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
                  BlocConsumer<MovieDetailsCubit, MovieDetailsState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      bool isSaved = false;
                      if (state is AddedWatchListSuccess) {
                        isSaved = state.isAdded;
                      } else if (state is CheckWatchListSuccess) {
                        isSaved = state.isSaved;
                      }
                      return state is AddedWatchListLoading
                          ? Center(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10.h),
                                width: 20.w,
                                height: 20.w,
                                child: CircularProgressIndicator(
                                  color: ColorsManager.yellowF6,
                                ),
                              ),
                            )
                          : IconButton(
                              onPressed: () async {
                                MovieDetailsCubit.get(
                                  context,
                                ).toggleWatchlist(movie: widget.movie!);
                              },
                              icon: SvgPicture.asset(
                                SvgsManager.favIcon,

                                color: isSaved
                                    ? ColorsManager.yellowFB
                                    : ColorsManager.white,
                              ),
                            );
                    },
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
