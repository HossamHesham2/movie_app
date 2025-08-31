import 'package:dio/dio.dart';
import 'package:movie_app/Features/movie/tabs/browse/data/data_source/data_remote/browse_remote_ds.dart';
import 'package:movie_app/core/database/api/api_consumer.dart';
import 'package:movie_app/core/database/api/end_points.dart';
import 'package:movie_app/core/errors/server_exception.dart';
import 'package:movie_app/core/models/get_all_movie_response.dart';

class BrowseRemoteDsImpl extends BrowseRemoteDs {
  ApiConsumer apiConsumer;

  BrowseRemoteDsImpl(this.apiConsumer);

  @override
  Future<GetAllMovieResponse> getAllMovies({String? genre}) async {
    try {
      final data = await apiConsumer.get(
        EndPoints.listMovie,
        queryParameters: {'genre': genre},
      );
      if (data == null || data.isEmpty) {
        throw ServerException("No data found");
      }
      GetAllMovieResponse getAllMovieResponse = GetAllMovieResponse.fromJson(
        data,
      );
      return getAllMovieResponse;
    } on DioException catch (e) {
      throw Exception("Failed to fetch all movies: ${e.message}");
    } on Exception {
      rethrow;
    }
  }
}
