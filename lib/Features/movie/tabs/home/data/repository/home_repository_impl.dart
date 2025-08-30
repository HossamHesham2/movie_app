import 'package:movie_app/Features/movie/tabs/home/data/data_source_contract/home_movie_remote_ds.dart';

import 'package:movie_app/Features/movie/tabs/home/data/model/get_all_movie_response.dart';
import 'package:movie_app/Features/movie/tabs/home/data/model/get_movie_suggestions_response.dart';
import 'package:movie_app/Features/movie/tabs/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeMovieRemoteDs homeMovieRemoteDs;

  HomeRepositoryImpl(this.homeMovieRemoteDs);

  @override
  Future<GetAllMovieResponse?> getAvailableNowMovies() async {
    try {
      return await homeMovieRemoteDs.getAllMovie();
    } catch (e) {
      rethrow;
    }
  }



  @override
  Future<GetMovieSuggestionsResponse?> getMovieSuggestions({
    required int movieId,
  }) async {
    try {
      return await homeMovieRemoteDs.getMovieSuggestions(movieId: movieId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GetAllMovieResponse?> getAllMovieByGenre({required String genre}) async{
    try {
      return await homeMovieRemoteDs.getAllMovieByGenre(genre: genre);
    } catch (e) {
      rethrow;
    }
  }
}
