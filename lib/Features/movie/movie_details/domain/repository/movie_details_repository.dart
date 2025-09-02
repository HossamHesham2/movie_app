import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/Features/movie/movie_details/data/model/get_movie_details_response.dart';
import 'package:movie_app/Features/movie/tabs/home/data/model/get_movie_suggestions_response.dart';

abstract class MovieDetailsRepository {
  Future<GetMovieDetailsResponse?> getMovieDetails({required int movieId});
  Future<GetMovieSuggestionsResponse?> getMovieSuggestions({
    required int movieId,
  });
  Future<bool> toggleWatchlist({required Movie movie});
  Future<DocumentSnapshot<Map<String, dynamic>>> checkWatchlist({required int movieId}) ;
}
