import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/Features/movie/movie_details/data/data_source_contract/movie_details_movie_remote_ds.dart';
import 'package:movie_app/Features/movie/movie_details/data/model/get_movie_detailes_response.dart';
import 'package:movie_app/Features/movie/movie_details/domain/repository/movie_details_repository.dart';
import 'package:movie_app/Features/movie/tabs/home/data/model/get_movie_suggestions_response.dart';

class MovieDetailsRepositoryImpl extends MovieDetailsRepository {
  final MovieDetailsRemoteDs movieDetailsMovieRemoteDs;

  MovieDetailsRepositoryImpl(this.movieDetailsMovieRemoteDs);

  @override
  Future<GetMovieDetailsResponse?> getMovieDetails({
    required int movieId,
  }) async {
    try {
      return await movieDetailsMovieRemoteDs.getMovieDetails(movieId: movieId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GetMovieSuggestionsResponse?> getMovieSuggestions({
    required int movieId,
  }) async {
    try {
      return await movieDetailsMovieRemoteDs.getMovieSuggestions(
        movieId: movieId,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> toggleWatchlist({required Movie movie}) async {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user?.uid;
    if (user == null) throw Exception("User not logged in");
    final watchListDoc = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection("watchlist")
        .doc(movie.id.toString());
    final snapshot = await watchListDoc.get();
    if (snapshot.exists) {
      await watchListDoc.delete();
      return false;
    } else {
      await watchListDoc.set(movie.toJson());
      return true;
    }
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> checkWatchlist({required int movieId}) async {
    final user = FirebaseAuth.instance.currentUser;


    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .collection('watchlist')
        .doc(movieId.toString())
        .get();
    return doc ;
  }
}
