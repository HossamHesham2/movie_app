import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Features/auth/presentation/widgets/custom_text_button.dart';
import 'package:movie_app/Features/movie/features/home/presentation/cubits/home_cubit.dart';
import 'package:movie_app/Features/movie/features/home/presentation/widgets/custom_carousel_slider_movie_list.dart';
import 'package:movie_app/Features/movie/features/home/presentation/widgets/custom_film_card.dart';
import 'package:movie_app/core/assets/assets_manager.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';
import 'package:movie_app/core/styles/style_manager.dart';

class HorrorMovieListWidget extends StatefulWidget {
  const HorrorMovieListWidget({super.key});

  @override
  State<HorrorMovieListWidget> createState() => _HorrorMovieListWidgetState();
}

class _HorrorMovieListWidgetState extends State<HorrorMovieListWidget> {
  @override
  void initState() {
    super.initState();
    HomeCubit.get(context).getMoviesByGenre(genre: 'horror');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final homeCubit = HomeCubit.get(context);
        final listHorrorMovies =
            homeCubit.moviesByGenre['horror']?.data?.movies ?? [];
        if (state is GetMoviesByGenreLoading && state.genre == 'horror') {
          return Center(
            child: CircularProgressIndicator(color: StyleManager.yellowFB),
          );
        }

        if (listHorrorMovies.isEmpty) {
          return const SizedBox.shrink();
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.appLocalizations!.horror,
                    style: StyleManager.regular20.copyWith(
                      color: StyleManager.white,
                    ),
                  ),
                  CustomTextButton(
                    text: "${context.appLocalizations!.see_more} ->",
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 300.h,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 16.w),
                  scrollDirection: Axis.horizontal,
                  itemCount: listHorrorMovies.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {},
                    child: CustomFilmCard(
                      posterImage:
                          listHorrorMovies[index].mediumCoverImage ?? "",
                      rate: listHorrorMovies[index].rating ?? 0.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
