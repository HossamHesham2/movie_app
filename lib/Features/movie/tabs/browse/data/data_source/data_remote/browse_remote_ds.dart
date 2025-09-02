import 'package:movie_app/core/models/get_all_movie_response.dart';

abstract class BrowseRemoteDs {
  Future<GetAllMovieResponse> getAllMovies({String? genre});

}