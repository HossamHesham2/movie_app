import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/Features/movie/movie_details/data/model/get_movie_details_response.dart';

part 'profile_state.dart';
@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(BuildContext context) =>
      BlocProvider.of<ProfileCubit>(context);

  void getMoviesWatchList() async {
    emit(GetMoviesWatchListLoading());
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        emit(GetMoviesWatchListFailure("User not logged in"));
        return;
      }
      final watchListSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('watchlist')
          .get();
      List<Movie?> movies = [];
      for (var doc in watchListSnapshot.docs) {
        movies.add(Movie.fromJson(doc.data()));
      }
      emit(GetMoviesWatchListSuccess(movies, movies.length));
    } on Exception catch (e) {
      emit(GetMoviesWatchListFailure(e.toString()));
    }
  }
}
