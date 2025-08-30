import 'package:movie_app/Features/movie/tabs/home/data/model/get_all_movie_response.dart';
import 'package:movie_app/Features/movie/tabs/home/data/model/get_movie_suggestions_response.dart';

abstract class HomeRepository {
  Future<GetAllMovieResponse?> getAvailableNowMovies();

  Future<GetAllMovieResponse?> getAllMovieByGenre({required String genre});


  Future<GetMovieSuggestionsResponse?> getMovieSuggestions({
    required int movieId,
  });
}
