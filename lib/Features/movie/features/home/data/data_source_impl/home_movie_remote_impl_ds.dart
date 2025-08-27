import 'package:dio/dio.dart';
import 'package:movie_app/Features/movie/features/home/data/data_source_contract/home_movie_remote_ds.dart';

import 'package:movie_app/Features/movie/features/home/data/model/get_all_movie_response.dart';
import 'package:movie_app/Features/movie/features/home/data/model/get_movie_detailes_response.dart';
import 'package:movie_app/Features/movie/features/home/data/model/get_movie_suggestions_response.dart';
import 'package:movie_app/core/database/api/api_consumer.dart';
import 'package:movie_app/core/database/api/end_points.dart';

class HomeMovieRemoteImplDs extends HomeMovieRemoteDs {
  ApiConsumer apiConsumer;

  HomeMovieRemoteImplDs(this.apiConsumer);

  @override
  Future<GetAllMovieResponse> getAllMovie() async {
    try {
      final data = await apiConsumer.get(
        EndPoints.listMovie,
      );
      if (data == null) {
        throw Exception("No data found");
      }
      GetAllMovieResponse getAllMovieResponse = GetAllMovieResponse.fromJson(
        data,
      );
      return getAllMovieResponse;
    } on DioException catch (e) {
      throw Exception("Failed to fetch all movies: ${e.message}");
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<GetMovieDetailsResponse> getMovieDetails({
    required int movieId,
  }) async {
    try {
      final data = await apiConsumer.get(
        EndPoints.movieDetails,
        queryParameters: {'movie_id': movieId},
      );
      if (data == null) {
        throw Exception("No data found");
      }
      GetMovieDetailsResponse getMovieDetailsResponse =
          GetMovieDetailsResponse.fromJson(data);
      return getMovieDetailsResponse;
    } on DioException catch (e) {
      throw Exception("Failed to fetch movie details: ${e.message}");
    } on Exception catch (e) {
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
      if (data == null) {
        throw Exception("No data found");
      }
      GetMovieSuggestionsResponse getMovieSuggestionsResponse =
          GetMovieSuggestionsResponse.fromJson(data);
      return getMovieSuggestionsResponse;
    } on DioException catch (e) {
      throw Exception("Failed to fetch movie suggestions: ${e.message}");
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<GetAllMovieResponse?> getAllMovieByGenre({
    required String genre,
  }) async {
    try {
      final data = await apiConsumer.get(
        EndPoints.listMovie,
        queryParameters: {'genre': genre},
      );
      if (data == null) {
        throw Exception("No data found");
      }
      GetAllMovieResponse getAllMovieResponse = GetAllMovieResponse.fromJson(
        data,
      );
      return getAllMovieResponse;
    } on DioException catch (e) {
      throw Exception("Failed to fetch all movies: ${e.message}");
    } on Exception catch (e) {
      rethrow;
    }
  }
}
