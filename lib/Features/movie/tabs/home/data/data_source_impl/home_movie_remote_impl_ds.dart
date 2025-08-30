import 'package:dio/dio.dart';
import 'package:movie_app/Features/movie/tabs/home/data/data_source_contract/home_movie_remote_ds.dart';

import 'package:movie_app/Features/movie/tabs/home/data/model/get_all_movie_response.dart';
import 'package:movie_app/Features/movie/tabs/home/data/model/get_movie_suggestions_response.dart';
import 'package:movie_app/core/database/api/api_consumer.dart';
import 'package:movie_app/core/database/api/end_points.dart';
import 'package:movie_app/core/errors/server_exception.dart';

class HomeMovieRemoteImplDs extends HomeMovieRemoteDs {
  ApiConsumer apiConsumer;

  HomeMovieRemoteImplDs(this.apiConsumer);

  @override
  Future<GetAllMovieResponse> getAllMovie() async {
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


  @override
  Future<GetMovieSuggestionsResponse> getMovieSuggestions({
    required int movieId,
  }) async {
    try {
      final data = await apiConsumer.get(
        EndPoints.movieSuggestions,
        queryParameters: {'movie_id': movieId},
      );
      if (data == null || data.isEmpty) {
        throw ServerException("No data found");
      }
      GetMovieSuggestionsResponse getMovieSuggestionsResponse =
          GetMovieSuggestionsResponse.fromJson(data);
      return getMovieSuggestionsResponse;
    } on DioException catch (e) {
      throw Exception("Failed to fetch movie suggestions: ${e.message}");
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<GetAllMovieResponse> getAllMovieByGenre({
    required String genre,
  }) async {
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
    } on Exception  {
      rethrow;
    }
  }
}
