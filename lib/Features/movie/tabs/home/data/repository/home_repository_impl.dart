import 'package:injectable/injectable.dart';
import 'package:movie_app/Features/movie/tabs/home/data/data_source_contract/home_movie_local_ds.dart';
import 'package:movie_app/Features/movie/tabs/home/data/data_source_contract/home_movie_remote_ds.dart';
import 'package:movie_app/Features/movie/tabs/home/domain/repository/home_repository.dart';
import 'package:movie_app/core/models/get_all_movie_response.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  final HomeMovieRemoteDs homeMovieRemoteDs;
  final HomeMovieLocaleDs homeMovieLocaleDs;

  HomeRepositoryImpl(this.homeMovieRemoteDs, this.homeMovieLocaleDs);

  @override
  Future<GetAllMovieResponse?> getAvailableNowMovies() async {
    try {
      final response = await homeMovieRemoteDs.getAllMovie();
      await homeMovieLocaleDs.saveData(getAllMovieResponse: response);
      return response;
    } catch (e) {
      final cached = await homeMovieLocaleDs.getData();
      if (cached != null) return cached;
      rethrow;
    }
  }

  @override
  Future<GetAllMovieResponse?> getAllMovieByGenre({
    required String genre,
  }) async {
    try {
      final response = await homeMovieRemoteDs.getAllMovieByGenre(genre: genre);

      await homeMovieLocaleDs.saveDataByGenre(
        genre: genre,
        getAllMovieResponse: response!,
      );

      return response;
    } catch (e) {
      final cached = await homeMovieLocaleDs.getDataByGenre(genre);
      if (cached != null) return cached;
      rethrow;
    }
  }
}
