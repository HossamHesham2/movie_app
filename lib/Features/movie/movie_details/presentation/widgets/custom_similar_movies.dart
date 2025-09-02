import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Features/movie/tabs/home/data/model/get_movie_suggestions_response.dart';
import 'package:movie_app/Features/movie/tabs/home/presentation/widgets/custom_film_card.dart';
import 'package:movie_app/config/routes/routes_manager.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';

class CustomSimilarMovies extends StatelessWidget {
  final List<Movies?> moviesSuggestions;

  const CustomSimilarMovies({super.key, required this.moviesSuggestions});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.appLocalizations!.similar,
          style: StyleInterManager.bold24.copyWith(color: ColorsManager.white),
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 700.h,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 10.w,
            ),
            itemCount: moviesSuggestions.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutesManager.movieDetailsView,
                  arguments: moviesSuggestions[index]?.id,
                );
              },
              child: CustomFilmCard(
                posterImage: moviesSuggestions[index]?.mediumCoverImage ?? "",
                rate: moviesSuggestions[index]?.rating ?? 0.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
