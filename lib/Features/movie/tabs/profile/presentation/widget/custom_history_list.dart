import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Features/movie/tabs/home/presentation/widgets/custom_film_card.dart';
import 'package:movie_app/Features/movie/tabs/profile/presentation/cubits/profile_cubit.dart';
import 'package:movie_app/config/routes/routes_manager.dart';
import 'package:movie_app/core/utils/assets_manager.dart';
import 'package:movie_app/core/utils/color_managers.dart';

class CustomHistoryList extends StatefulWidget {
  final void Function(int?)? counterHistoryList;

  const CustomHistoryList({super.key, this.counterHistoryList});

  @override
  State<CustomHistoryList> createState() => _CustomHistoryListState();
}

class _CustomHistoryListState extends State<CustomHistoryList> {
  @override
  void initState() {
    super.initState();
    ProfileCubit.get(context).getMoviesHistory();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        if (state is GetMoviesHistoryLoading) {
          return Center(
            child: CircularProgressIndicator(color: ColorsManager.yellowF6),
          );
        } else if (state is GetMoviesHistorySuccess) {
          final movies = state.moviesHistory;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            widget.counterHistoryList?.call(state.count);
          });

          if (movies.isEmpty) {
            return Center(child: Image.asset(PngManager.emptyBg));
          }
          return GridView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutesManager.movieDetailsView,
                    arguments: movie?.id,
                  );
                },
                child: CustomFilmCard(
                  posterImage: movie?.largeCoverImage ?? "",
                  rate: movie?.rating ?? 0.0,
                ),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 20.h,
              childAspectRatio: 191.w / 279.h,
            ),
          );
        } else if (state is GetMoviesHistoryFailure) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
