part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class GetMoviesWatchListLoading extends ProfileState {}

final class GetMoviesWatchListSuccess extends ProfileState {
  final List<Movie?> movies;
  final int count ;

  GetMoviesWatchListSuccess(this.movies, this.count);
}

final class GetMoviesWatchListFailure extends ProfileState {
  final String errorMessage;

  GetMoviesWatchListFailure(this.errorMessage);
}


final class GetMoviesHistoryLoading extends ProfileState {}

final class GetMoviesHistorySuccess extends ProfileState {
  final List<Movie?> moviesHistory;
  final int count ;

  GetMoviesHistorySuccess(this.moviesHistory, this.count);
}

final class GetMoviesHistoryFailure extends ProfileState {
  final String errorMessage;

  GetMoviesHistoryFailure(this.errorMessage);
}