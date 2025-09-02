import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/Features/movie/tabs/search/data/data_source_contract/search_movies_remote_ds.dart';

import 'package:movie_app/core/models/get_all_movie_response.dart';
import 'package:movie_app/core/database/api/api_consumer.dart';
import 'package:movie_app/core/database/api/end_points.dart';
import 'package:movie_app/core/errors/server_exception.dart';
@Injectable(as: SearchMoviesRemoteDs)
class SearchMoviesRemoteDsImpl extends SearchMoviesRemoteDs {
  ApiConsumer apiConsumer;
@factoryMethod
  SearchMoviesRemoteDsImpl(this.apiConsumer);

  @override
  Future<GetAllMovieResponse?> getAllMovie() async {
    try {
      final data = await apiConsumer.get(EndPoints.listMovie);
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
