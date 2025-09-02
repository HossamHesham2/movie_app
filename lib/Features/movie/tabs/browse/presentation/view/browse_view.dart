import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Features/movie/tabs/browse/presentation/cubits/browse_cubit.dart';
import 'package:movie_app/Features/movie/tabs/browse/presentation/widgets/browse_tab_bar.dart';
import 'package:movie_app/Features/movie/tabs/home/presentation/widgets/custom_film_card.dart';
import 'package:movie_app/config/routes/routes_manager.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';

class BrowseView extends StatefulWidget {
  const BrowseView({super.key});

  @override
  State<BrowseView> createState() => _BrowseViewState();
}

class _BrowseViewState extends State<BrowseView> {
  @override
  void initState() {
    super.initState();
    BrowseCubit.get(context).getAllMovies();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrowseCubit, BrowseState>(
      builder: (context, state) {
        if (state is BrowseFailure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage,
                  style: StyleInterManager.regular20.copyWith(
                    color: ColorsManager.yellowFB,
                  ),
                ),
              ),
            );
          });
        }

        if (state is BrowseLoading) {
          return Center(
            child: CircularProgressIndicator(color: ColorsManager.yellowFB),
          );
        }

        if (state is BrowseSuccess) {
          final movies = state.movies?.data?.movies ?? [];

          final genresSet = <String>{};
          for (var movie in movies) {
            if (movie.genres != null) {
              genresSet.addAll(movie.genres!);
            }
          }

          final genresList = genresSet.toList();

          return DefaultTabController(
            length: genresList.length,
            child: Scaffold(
              backgroundColor: ColorsManager.transparent,
              appBar: AppBar(
                backgroundColor: ColorsManager.transparent,

                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(10.h),
                  child: BrowseTabBar(
                    genres: genresList,
                    onTap: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
              body: TabBarView(
                children: genresList.map((genre) {
                  final filteredMovies = movies.where((movie) {
                    return movie.genres?.contains(genre) ?? false;
                  }).toList();

                  return GridView.builder(
                    padding: EdgeInsets.all(10.w),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 20.h,
                      childAspectRatio: 191.w / 279.h,
                    ),
                    itemCount: filteredMovies.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RoutesManager.movieDetailsView,
                            arguments: filteredMovies[index].id,
                          );
                        },
                        child: CustomFilmCard(
                          posterImage:
                              filteredMovies[index].largeCoverImage ?? "",
                          rate: filteredMovies[index].rating ?? 0,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          );
        }

        return Container();
      },
    );
  }
}
