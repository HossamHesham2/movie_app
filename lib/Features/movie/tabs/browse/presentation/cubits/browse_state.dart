part of 'browse_cubit.dart';

@immutable
sealed class BrowseState {}

final class BrowseInitial extends BrowseState {}

final class BrowseLoading extends BrowseState {}

final class BrowseSuccess extends BrowseState {
  final String genre;
  final GetAllMovieResponse? movies;

  BrowseSuccess({required this.genre, required this.movies});
}

final class BrowseFailure extends BrowseState {
  final String errorMessage;

  BrowseFailure(this.errorMessage);
}
