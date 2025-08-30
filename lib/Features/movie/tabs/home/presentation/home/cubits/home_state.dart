part of 'home_cubit.dart';

@immutable
sealed class HomeState {
  const HomeState();


}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

class GetMoviesByGenreSuccess extends HomeState {
  final String genre;
  final GetAllMovieResponse? movies;

  const GetMoviesByGenreSuccess({required this.genre, required this.movies});


}

class GetMoviesByGenreLoading extends HomeState {
  final String genre;

  const GetMoviesByGenreLoading({required this.genre});


}

final class GetMoviesByGenreFailure extends HomeState {
  final String errorMessage;

  const GetMoviesByGenreFailure(this.errorMessage);


}

final class GetAvailableNowMoviesLoading extends HomeState {}

final class GetAvailableNowMoviesSuccess extends HomeState {
  final GetAllMovieResponse? movies;

  const GetAvailableNowMoviesSuccess({required this.movies});

}

final class GetAvailableNowMoviesFailure extends HomeState {
  final String errorMessage;

  const GetAvailableNowMoviesFailure(this.errorMessage);


}


