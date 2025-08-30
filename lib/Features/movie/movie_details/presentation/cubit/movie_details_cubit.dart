import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/Features/movie/movie_details/data/model/get_movie_detailes_response.dart';
import 'package:movie_app/Features/movie/movie_details/domain/repository/movie_details_repository.dart';
import 'package:movie_app/Features/movie/tabs/home/domain/repository/home_repository.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsRepository movieDetailsRepository;
  GetMovieDetailsResponse? getMovieDetailsResponse;

  MovieDetailsCubit(this.movieDetailsRepository) : super(MovieDetailsInitial());

  static MovieDetailsCubit get(context) =>
      BlocProvider.of<MovieDetailsCubit>(context);

  void getMovieDetails({required int movieId}) async {
    try {
      emit(MovieDetailsLoading());
      final movie = await movieDetailsRepository.getMovieDetails(movieId: movieId);
      getMovieDetailsResponse = movie;
      print("Movie is ----> ${movie?.data?.movie?.title}");
      emit(MovieDetailsSuccess(movie: movie));
    } on Exception catch (e) {
      emit(MovieDetailsFailure(e.toString()));
    }
  }
}
