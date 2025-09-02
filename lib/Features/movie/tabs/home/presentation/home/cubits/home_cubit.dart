import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/models/get_all_movie_response.dart';
import 'package:movie_app/Features/movie/tabs/home/domain/repository/home_repository.dart';

part 'home_state.dart';
@injectable
class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;

  HomeCubit(this.homeRepository) : super(HomeInitial());

  GetAllMovieResponse? availableNowMovies;
  Map<String, GetAllMovieResponse?> moviesByGenre = {};

  static HomeCubit get(BuildContext context) =>
      BlocProvider.of<HomeCubit>(context);

  void getAvailableNowMovies() async {
    try {
      emit(GetAvailableNowMoviesLoading());
      final movies = await homeRepository.getAvailableNowMovies();
      availableNowMovies = movies;
      emit(GetAvailableNowMoviesSuccess(movies: movies));
    } on Exception catch (e) {
      emit(GetAvailableNowMoviesFailure(e.toString()));
    }
  }

  void getMoviesByGenre({required String genre}) async {
    if (moviesByGenre[genre]?.data?.movies?.isNotEmpty == true) {
      emit(GetMoviesByGenreSuccess(genre: genre, movies: moviesByGenre[genre]));
      return;
    }
    try {
      emit(GetMoviesByGenreLoading(genre: genre));
      final movies = await homeRepository.getAllMovieByGenre(genre: genre);

      moviesByGenre[genre] = movies;

      emit(GetMoviesByGenreSuccess(genre: genre, movies: movies));
    } on Exception catch (e) {
      emit(GetMoviesByGenreFailure(e.toString()));
    }
  }




}
