import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Features/auth/presentation/widgets/custom_text_button.dart';
import 'package:movie_app/Features/movie/tabs/home/presentation/home/cubits/home_cubit.dart';
import 'package:movie_app/Features/movie/tabs/home/presentation/widgets/custom_film_card.dart';
import 'package:movie_app/config/routes/routes_manager.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';

class ActionMovieListWidget extends StatefulWidget {
  const ActionMovieListWidget({super.key});

  @override
  State<ActionMovieListWidget> createState() => _ActionMovieListWidgetState();
}

class _ActionMovieListWidgetState extends State<ActionMovieListWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      HomeCubit.get(context).getMoviesByGenre(genre: 'action');
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final homeCubit = HomeCubit.get(context);
        final listActionMovies =
            homeCubit.moviesByGenre['action']?.data?.movies ?? [];

        if (listActionMovies.isEmpty) {
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
                    context.appLocalizations!.action,
                    style: StyleInterManager.regular20.copyWith(
                      color: ColorsManager.white,
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
                  itemCount: listActionMovies.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RoutesManager.movieDetailsView,
                        arguments: listActionMovies[index].id,
                      );
                    },
                    child: CustomFilmCard(
                      posterImage:
                          listActionMovies[index].mediumCoverImage ?? "",
                      rate: listActionMovies[index].rating ?? 0.0,
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
