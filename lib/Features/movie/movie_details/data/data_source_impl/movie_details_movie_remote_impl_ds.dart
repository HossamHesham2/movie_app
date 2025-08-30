import 'package:dio/dio.dart';
import 'package:movie_app/Features/movie/movie_details/data/data_source_contract/movie_details_movie_remote_ds.dart';
import 'package:movie_app/Features/movie/movie_details/data/model/get_movie_detailes_response.dart';
import 'package:movie_app/Features/movie/tabs/home/data/model/get_movie_suggestions_response.dart';

import 'package:movie_app/core/database/api/api_consumer.dart';
import 'package:movie_app/core/database/api/end_points.dart';
import 'package:movie_app/core/errors/server_exception.dart';

class MovieDetailsRemoteImplDs extends MovieDetailsRemoteDs {
  ApiConsumer apiConsumer;

  MovieDetailsRemoteImplDs(this.apiConsumer);

  @override
  Future<GetMovieDetailsResponse> getMovieDetails({
    required int movieId,
  }) async {
    try {
      final data = await apiConsumer.get(
        EndPoints.movieDetails,
        queryParameters: {'movie_id': movieId},
      );
      if (data == null || data.isEmpty) {
        throw ServerException("No data found");
      }

      GetMovieDetailsResponse getMovieDetailsResponse =
          GetMovieDetailsResponse.fromJson(data);
      return getMovieDetailsResponse;
    } on DioException catch (e) {
      throw Exception("Failed to fetch movie details: ${e.message}");
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
}
