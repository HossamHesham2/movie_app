import 'package:movie_app/Features/movie/tabs/browse/data/data_source/data_remote/browse_remote_ds.dart';
import 'package:movie_app/Features/movie/tabs/browse/domain/repository/browse_repository.dart';
import 'package:movie_app/core/models/get_all_movie_response.dart';

class BrowseRepositoryImpl extends BrowseRepository {
  BrowseRemoteDs browseRemoteDs;

  BrowseRepositoryImpl(this.browseRemoteDs);

  @override
  Future<GetAllMovieResponse> getAllMovies({String? genre}) async {
    try {
      return await browseRemoteDs.getAllMovies();
    } catch (e) {
      rethrow;
    }
  }
}
