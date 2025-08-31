import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Features/movie/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'package:movie_app/Features/movie/tabs/home/presentation/widgets/custom_film_card.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';
import 'package:movie_app/core/utils/assets_manager.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';

class CustomSimilarMovies extends StatefulWidget {
  final int movieId;

  const CustomSimilarMovies({super.key, required this.movieId});

  @override
  State<CustomSimilarMovies> createState() => _CustomSimilarMoviesState();
}

class _CustomSimilarMoviesState extends State<CustomSimilarMovies> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      MovieDetailsCubit.get(
        context,
      ).getMovieSuggestions(movieId: widget.movieId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        if (state is MovieDetailsLoading) {
          return Center(
            child: CircularProgressIndicator(color: ColorsManager.yellowFB),
          );
        } else if (state is MovieSuggestionSuccess) {
          final moviesSuggestions = state.moviesList;
          if (moviesSuggestions.isEmpty) {
            return Center(child: Image.asset(PngManager.emptyBg));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.appLocalizations!.similar,
                style: StyleInterManager.bold24.copyWith(
                  color: ColorsManager.white,
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 500.h,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: moviesSuggestions.length,
                  itemBuilder: (context, index) => CustomFilmCard(
                    posterImage:
                        moviesSuggestions[index]?.mediumCoverImage ?? "",
                    rate: moviesSuggestions[index]?.rating ?? 0.0,
                  ),
                ),
              ),
            ],
          );
        } else if (state is MovieDetailsFailure) {
          return Text(
            "Failed to load similar movies",
            style: TextStyle(color: Colors.red),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
