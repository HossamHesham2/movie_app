import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/Features/movie/movie_details/data/model/get_movie_details_response.dart';
import 'package:movie_app/Features/movie/movie_details/domain/repository/movie_details_repository.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/movie/tabs/home/data/model/get_movie_suggestions_response.dart';

part 'movie_details_state.dart';

@injectable
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
      if (movie?.data?.movie != null) {
        await movieDetailsRepository.addToHistoryList(
          movie: movie!.data!.movie!,
        );
      }
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

  void toggleWatchlist({required Movie movie}) async {
    emit(AddedHistoryListLoading());
    try {
      final isAdded = await movieDetailsRepository.toggleWatchlist(
        movie: movie,
      );
      emit(AddedHistoryListSuccess(isAdded));
    } catch (e) {
      emit(AddedHistoryListFailure(e.toString()));
    }
  }

  void checkWatchlist({required int? movieId}) async {
    final doc = await movieDetailsRepository.checkWatchlist(movieId: movieId!);
    emit(CheckWatchListSuccess(doc.exists));
  }

  void checkHistoryList({required int? movieId}) async {
    final doc = await movieDetailsRepository.checkHistoryList(
      movieId: movieId!,
    );
    emit(CheckHistoryListSuccess(doc.exists));
  }
  void addToHistoryList({required Movie movie}) async {
    try {
      await movieDetailsRepository.addToHistoryList(movie: movie);
    } catch (e) {
      print("Error adding to historyList: $e");
    }
  }

}
