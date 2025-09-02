part of 'movie_details_cubit.dart';

@immutable
sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}

final class MovieDetailsLoading extends MovieDetailsState {}

final class MovieDetailsSuccess extends MovieDetailsState {
  final GetMovieDetailsResponse? movie;

  MovieDetailsSuccess({required this.movie});
}

final class MovieDetailsFailure extends MovieDetailsState {
  final String errorMessage;

  MovieDetailsFailure(this.errorMessage);
}

final class MovieSuggestionLoading extends MovieDetailsState {}

final class MovieSuggestionSuccess extends MovieDetailsState {
  final List<Movies?> moviesList;

  MovieSuggestionSuccess({required this.moviesList});
}

final class MovieSuggestionFailure extends MovieDetailsState {
  final String errorMessage;

  MovieSuggestionFailure(this.errorMessage);
}

final class AddedWatchListLoading extends MovieDetailsState {}

final class AddedWatchListSuccess extends MovieDetailsState {
  final bool isAdded ;

  AddedWatchListSuccess(this.isAdded);
}

final class AddedWatchListFailure extends MovieDetailsState {
  final String errorMessage;

  AddedWatchListFailure(this.errorMessage);
}
final class CheckWatchListSuccess extends MovieDetailsState {
  final bool isSaved;
  CheckWatchListSuccess(this.isSaved);
}