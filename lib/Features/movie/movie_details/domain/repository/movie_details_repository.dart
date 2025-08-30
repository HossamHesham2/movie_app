import 'package:movie_app/Features/movie/movie_details/data/model/get_movie_detailes_response.dart';
import 'package:movie_app/Features/movie/tabs/home/data/model/get_movie_suggestions_response.dart';

abstract class MovieDetailsRepository {
  Future<GetMovieDetailsResponse?> getMovieDetails({required int movieId});
  Future<GetMovieSuggestionsResponse?> getMovieSuggestions({
    required int movieId,
  });
}
