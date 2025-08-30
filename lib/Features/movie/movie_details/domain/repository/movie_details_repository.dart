import 'package:movie_app/Features/movie/movie_details/data/model/get_movie_detailes_response.dart';

abstract class MovieDetailsRepository {
  Future<GetMovieDetailsResponse?> getMovieDetails({required int movieId});
}
