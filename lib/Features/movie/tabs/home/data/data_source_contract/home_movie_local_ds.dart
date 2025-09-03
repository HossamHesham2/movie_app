import 'package:movie_app/core/models/get_all_movie_response.dart';

abstract class HomeMovieLocaleDs {
  Future<GetAllMovieResponse?> getData();
  Future<void> saveData({required GetAllMovieResponse? getAllMovieResponse});
  Future<GetAllMovieResponse?> getDataByGenre(String genre);
  Future<void> saveDataByGenre({
    required String genre,
    required GetAllMovieResponse getAllMovieResponse,
  });
}
