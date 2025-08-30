import 'package:movie_app/core/models/get_all_movie_response.dart';

abstract class HomeRepository {
  Future<GetAllMovieResponse?> getAvailableNowMovies();

  Future<GetAllMovieResponse?> getAllMovieByGenre({required String genre});



}
