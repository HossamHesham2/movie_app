part of 'home_cubit.dart';

@immutable
sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

class GetMoviesByGenreSuccess extends HomeState {
  final String genre;
  final GetAllMovieResponse? movies;

  const GetMoviesByGenreSuccess({required this.genre, required this.movies});

  @override
  List<Object?> get props => [genre, movies];
}

class GetMoviesByGenreLoading extends HomeState {
  final String genre;

  const GetMoviesByGenreLoading({required this.genre});

  @override
  List<Object?> get props => [genre];
}

final class GetMoviesByGenreFailure extends HomeState {
  final String errorMessage;

  const GetMoviesByGenreFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

final class GetAvailableNowMoviesLoading extends HomeState {}

final class GetAvailableNowMoviesSuccess extends HomeState {
  final GetAllMovieResponse? movies;

  const GetAvailableNowMoviesSuccess({required this.movies});

  @override
  List<Object?> get props => [movies];
}

final class GetAvailableNowMoviesFailure extends HomeState {
  final String errorMessage;

  const GetAvailableNowMoviesFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

final class GetMovieDetailsLoading extends HomeState {}

final class GetMovieDetailsSuccess extends HomeState {
  final GetMovieDetailsResponse? movie;

  const GetMovieDetailsSuccess({required this.movie});

  @override
  List<Object?> get props => [movie];
}

final class GetMovieDetailsFailure extends HomeState {
  final String errorMessage;

  const GetMovieDetailsFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
