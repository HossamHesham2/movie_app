import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Features/movie/features/home/presentation/cubits/home_cubit.dart';
import 'package:movie_app/Features/movie/features/home/presentation/widgets/custom_carousel_slider_movie_list.dart';
import 'package:movie_app/config/routes/routes_manager.dart';
import 'package:movie_app/core/assets/assets_manager.dart';
import 'package:movie_app/core/styles/style_manager.dart';

class AllMovieListWidget extends StatefulWidget {
  const AllMovieListWidget({super.key});

  @override
  State<AllMovieListWidget> createState() => _AllMovieListWidgetState();
}

class _AllMovieListWidgetState extends State<AllMovieListWidget> {
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    HomeCubit.get(context).getAvailableNowMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is GetAvailableNowMoviesSuccess) {
          final homeCubit = HomeCubit.get(context);
          final availableNowMovie =
              homeCubit.availableNowMovies!.data!.movies ?? [];
          return Column(
            children: [
              Stack(
                children: [
                  Positioned.fill(
                    child: CachedNetworkImage(
                      imageUrl:
                          availableNowMovie[currentPageIndex].largeCoverImage ??
                          "",
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                          color: StyleManager.yellowFB,
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),

                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            StyleManager.black12.withValues(alpha: 0.4),
                            StyleManager.black12.withValues(alpha: 0.8),
                            StyleManager.black12,
                          ],
                        ),
                      ),
                    ),
                  ),

                  SafeArea(
                    child: Column(
                      children: [
                        Image.asset(
                          PngManager.availableNow,
                          width: double.infinity,
                        ),

                        SizedBox(height: 10.h),

                        CustomCarouselSliderMovieList(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RoutesManager.movieDetailsView,
                              arguments: availableNowMovie[currentPageIndex].id,
                            );
                          },
                          listMovies: availableNowMovie,
                          selectedIndexFunction: (index) {
                            setState(() {
                              currentPageIndex = index;
                            });
                          },
                        ),

                        SizedBox(height: 20.h),
                        Image.asset(
                          PngManager.watchNow,
                          width: double.infinity,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        } else if (state is GetAvailableNowMoviesFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: StyleManager.regular16.copyWith(
                color: StyleManager.yellowFB,
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
