import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/movie/features/home/data/model/get_all_movie_response.dart';
import 'package:movie_app/Features/movie/features/home/data/model/get_movie_detailes_response.dart';
import 'package:movie_app/Features/movie/features/home/domain/repository/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;

  HomeCubit(this.homeRepository) : super(HomeInitial());

  GetAllMovieResponse? availableNowMovies;
  GetMovieDetailsResponse? getMovieDetailsResponse;
  Map<String, GetAllMovieResponse?> moviesByGenre = {};

  static HomeCubit get(BuildContext context) =>
      BlocProvider.of<HomeCubit>(context);

  void getAvailableNowMovies() async {
    if (availableNowMovies != null &&
        availableNowMovies!.data!.movies!.isNotEmpty) {
      return;
    }
    try {
      emit(GetAvailableNowMoviesLoading());
      final movies = await homeRepository.getAvailableNowMovies();
      availableNowMovies = movies;
      print("Movies List ----> ${movies?.data?.movies?[0].title}");
      emit(GetAvailableNowMoviesSuccess(movies: movies));
    } on Exception catch (e) {
      emit(GetAvailableNowMoviesFailure(e.toString()));
    }
  }

  void getMoviesByGenre({required String genre}) async {
    if (moviesByGenre[genre]?.data?.movies?.isNotEmpty == true) {
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

  void getMovieDetails({required int movieId}) async {
    if (getMovieDetailsResponse != null &&
        getMovieDetailsResponse!.data!.movie != null) {
      return;
    }
    try {
      emit(GetMovieDetailsLoading());
      final movie = await homeRepository.getMovieDetails(movieId: movieId);
      getMovieDetailsResponse = movie;
      print("Movie is ----> ${movie?.data?.movie?.title}");
      emit(GetMovieDetailsSuccess(movie: movie));
    } on Exception catch (e) {
      emit(GetMovieDetailsFailure(e.toString()));
    }
  }
}
