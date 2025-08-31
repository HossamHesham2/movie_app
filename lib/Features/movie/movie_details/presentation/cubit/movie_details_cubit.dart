import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/movie/movie_details/data/model/get_movie_detailes_response.dart';
import 'package:movie_app/Features/movie/movie_details/domain/repository/movie_details_repository.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/movie/tabs/home/data/model/get_movie_suggestions_response.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsRepository movieDetailsRepository;
  GetMovieDetailsResponse? getMovieDetailsResponse;
  GetMovieSuggestionsResponse? getMovieSuggestionsResponse;

  MovieDetailsCubit(this.movieDetailsRepository) : super(MovieDetailsInitial());

  static MovieDetailsCubit get(BuildContext context) =>
      BlocProvider.of<MovieDetailsCubit>(context);

  void getMovieDetails({required int movieId}) async {
    try {
      emit(MovieDetailsLoading());
      final movie = await movieDetailsRepository.getMovieDetails(
        movieId: movieId,
      );
      getMovieDetailsResponse = movie;
      emit(MovieDetailsSuccess(movie: movie));
    } on Exception catch (e) {
      emit(MovieDetailsFailure(e.toString()));
    }
  }

  void getMovieSuggestions({required int movieId}) async {
    try {
      emit(MovieSuggestionLoading());
      final suggestion = await movieDetailsRepository.getMovieSuggestions(
        movieId: movieId,
      );
      getMovieSuggestionsResponse = suggestion;
      List<Movies?> moviesList = suggestion?.data?.movies ?? [];
      emit(MovieSuggestionSuccess(moviesList: moviesList));
    } on Exception catch (e) {
      emit(MovieSuggestionFailure(e.toString()));
    }
  }
}
