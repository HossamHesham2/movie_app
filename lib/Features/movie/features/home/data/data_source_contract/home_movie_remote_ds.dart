import 'package:movie_app/Features/movie/features/home/data/model/get_all_movie_response.dart';
import 'package:movie_app/Features/movie/features/home/data/model/get_movie_detailes_response.dart';
import 'package:movie_app/Features/movie/features/home/data/model/get_movie_suggestions_response.dart';

abstract class HomeMovieRemoteDs {
  Future<GetAllMovieResponse?> getAllMovie();

  Future<GetAllMovieResponse?> getAllMovieByGenre({required String genre});

  Future<GetMovieDetailsResponse?> getMovieDetails({required int movieId});

  Future<GetMovieSuggestionsResponse?> getMovieSuggestions({
    required int movieId,
  });
}
