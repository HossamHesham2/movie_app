import 'package:movie_app/Features/movie/movie_details/data/data_source_contract/movie_details_movie_remote_ds.dart';
import 'package:movie_app/Features/movie/movie_details/data/model/get_movie_detailes_response.dart';
import 'package:movie_app/Features/movie/movie_details/domain/repository/movie_details_repository.dart';
import 'package:movie_app/Features/movie/tabs/home/data/model/get_movie_suggestions_response.dart';

class MovieDetailsRepositoryImpl extends MovieDetailsRepository {
  final MovieDetailsRemoteDs movieDetailsMovieRemoteDs;

  MovieDetailsRepositoryImpl(this.movieDetailsMovieRemoteDs);

  @override
  Future<GetMovieDetailsResponse?> getMovieDetails({
    required int movieId,
  }) async {
    try {
      return await movieDetailsMovieRemoteDs.getMovieDetails(movieId: movieId);
    } catch (e) {
      rethrow;
    }
  }
  @override
  Future<GetMovieSuggestionsResponse?> getMovieSuggestions({
    required int movieId,
  }) async {
    try {
      return await movieDetailsMovieRemoteDs.getMovieSuggestions(movieId: movieId);
    } catch (e) {
      rethrow;
    }
  }
}
