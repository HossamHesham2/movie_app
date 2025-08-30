import 'package:movie_app/core/models/get_all_movie_response.dart';

abstract class SearchRepository {
  Future<GetAllMovieResponse?> getAllMovies();
}