import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Features/auth/presentation/widgets/custom_text_button.dart';
import 'package:movie_app/Features/movie/movie_details/data/model/get_movie_details_response.dart';
import 'package:movie_app/Features/movie/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'package:movie_app/Features/movie/movie_details/presentation/widgets/custom_box_container.dart';
import 'package:movie_app/Features/movie/movie_details/presentation/widgets/custom_genres.dart';
import 'package:movie_app/Features/movie/movie_details/presentation/widgets/custom_movie_poster.dart';
import 'package:movie_app/Features/movie/movie_details/presentation/widgets/custom_screen_shots.dart';
import 'package:movie_app/Features/movie/movie_details/presentation/widgets/custom_similar_movies.dart';
import 'package:movie_app/Features/movie/movie_details/presentation/widgets/custom_summary.dart';
import 'package:movie_app/Features/movie/movie_details/presentation/widgets/custom_movie_castes.dart';
import 'package:movie_app/Features/movie/tabs/home/data/model/get_movie_suggestions_response.dart';

import 'package:movie_app/core/extensions/build_context_extension.dart';
import 'package:movie_app/core/utils/assets_manager.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';
import 'package:movie_app/core/widgets/custom_elevated_button.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({super.key});

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  int? movieId;
  Movie? movie;
  List<Movies?> moviesSuggestions = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final newMovieId = ModalRoute.of(context)?.settings.arguments as int?;
    if (newMovieId != null) {
      movieId = newMovieId;
      MovieDetailsCubit.get(context).getMovieDetails(movieId: newMovieId);
      print("Id -> $newMovieId");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MovieDetailsCubit, MovieDetailsState>(
        listener: (context, state) {
          if (state is MovieSuggestionSuccess) {
            setState(() {
              moviesSuggestions = state.moviesList;
            });
          }

          if (state is MovieDetailsFailure) {
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
          }

          if (state is MovieDetailsSuccess) {
            movie = state.movie?.data?.movie;
            if (movieId != null) {
              MovieDetailsCubit.get(
                context,
              ).getMovieSuggestions(movieId: movieId!);
            }
          }
        },
        builder: (context, state) {
          if (state is MovieDetailsLoading) {
            return Center(
              child: CircularProgressIndicator(color: ColorsManager.yellowFB),
            );
          }

          if (state is MovieDetailsSuccess || moviesSuggestions.isNotEmpty) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  CustomMoviePoster(movie: movie),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        CustomElevatedButton(
                          text: context.appLocalizations!.watch,
                          borderColor: ColorsManager.redF8,
                          backgroundColor: ColorsManager.redF8,
                          textColor: ColorsManager.white,
                          onPressed: () {},
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          spacing: 10.w,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CustomBoxContainer(
                                icon: Icons.favorite,
                                numberInt: movie?.likeCount,
                              ),
                            ),
                            Expanded(
                              child: CustomBoxContainer(
                                icon: Icons.access_time_outlined,
                                numberInt: movie?.runtime,
                              ),
                            ),
                            Expanded(
                              child: CustomBoxContainer(
                                icon: Icons.star,
                                numberDouble: movie?.rating,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        CustomScreenShots(movie: movie),
                        SizedBox(height: 10.h),
                        if (moviesSuggestions.isEmpty)
                          Image.asset(PngManager.emptyBg),
                        if (moviesSuggestions.isNotEmpty)
                          CustomSimilarMovies(
                            moviesSuggestions: moviesSuggestions,
                          ),
                        SizedBox(height: 10.h),
                        CustomSummary(movie: movie),
                        SizedBox(height: 10.h),
                        CustomMovieCastes(movie: movie),
                        SizedBox(height: 10.h),
                        CustomGenres(movie: movie),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
