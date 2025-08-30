import 'package:movie_app/Features/movie/tabs/search/data/data_source_contract/search_movies_remote_ds.dart';
import 'package:movie_app/Features/movie/tabs/search/domain/repository/search_repository.dart';
import 'package:movie_app/core/models/get_all_movie_response.dart';

class SearchRepositoryImpl extends SearchRepository {
  SearchMoviesRemoteDs searchMoviesRemoteDs;

  SearchRepositoryImpl(this.searchMoviesRemoteDs);

  @override
  Future<GetAllMovieResponse?> getAllMovies() async {
    try {
      final response = await searchMoviesRemoteDs.getAllMovie();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
