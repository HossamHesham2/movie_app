import 'package:movie_app/core/models/get_all_movie_response.dart';

abstract class HomeMovieRemoteDs {
  Future<GetAllMovieResponse?> getAllMovie();

  Future<GetAllMovieResponse?> getAllMovieByGenre({required String genre});



}
