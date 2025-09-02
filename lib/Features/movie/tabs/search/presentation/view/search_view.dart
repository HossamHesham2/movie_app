import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/Features/movie/tabs/home/presentation/widgets/custom_film_card.dart';
import 'package:movie_app/Features/movie/tabs/search/presentation/cubits/search_cubit.dart';
import 'package:movie_app/config/routes/routes_manager.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';
import 'package:movie_app/core/utils/assets_manager.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';
import 'package:movie_app/core/widgets/custom_text_form_field.dart';

class SearchView extends StatefulWidget {
  SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SearchCubit.get(context).getAvailableNowMovies();
  }

  List filteredMoviesList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.transparent,

      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchLoading) {
            return Center(
              child: CircularProgressIndicator(color: ColorsManager.yellowFB),
            );
          } else if (state is SearchFailure) {
            return Center(
              child: Text(
                "No data found",
                style: StyleInterManager.bold20.copyWith(
                  color: ColorsManager.yellowFB,
                ),
              ),
            );
          } else if (state is SearchSuccess) {
            final moviesList = state.moviesList;

            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Column(
                  children: [
                    CustomTextFormField(
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.0.h,
                          horizontal: 10.h,
                        ),
                        child: SvgPicture.asset(
                          SvgsManager.searchIcon,
                          fit: BoxFit.fill,
                        ),
                      ),
                      hint: context.appLocalizations!.search,
                      obscureText: false,
                      onChanged: (input) {
                        setState(() {
                          if (input.isEmpty) {
                            filteredMoviesList = moviesList;
                          } else {
                            filteredMoviesList = moviesList
                                .where(
                                  (movie) =>
                                      movie?.title?.toLowerCase().contains(
                                        input.toLowerCase(),
                                      ) ??
                                      false,
                                )
                                .toList();
                          }
                        });
                      },
                    ),
                    SizedBox(height: 15.h),
                    if (filteredMoviesList.isEmpty)
                      Expanded(
                        child: Image.asset(PngManager.emptyBg),
                      ),
                    if (filteredMoviesList.isNotEmpty)
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 20.h,
                          childAspectRatio: 191.w / 279.h,
                        ),
                        itemCount: filteredMoviesList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RoutesManager.movieDetailsView,
                                arguments: filteredMoviesList[index]?.id,
                              );
                            },
                            child: CustomFilmCard(
                              posterImage:
                                  filteredMoviesList[index]?.largeCoverImage ??
                                  "",
                              rate: filteredMoviesList[index]?.rating ?? 0,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
