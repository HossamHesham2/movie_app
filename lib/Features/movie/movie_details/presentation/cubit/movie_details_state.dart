part of 'movie_details_cubit.dart';

@immutable
sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}

final class MovieDetailsLoading extends MovieDetailsState {}

final class MovieDetailsSuccess extends MovieDetailsState {
  final GetMovieDetailsResponse? movie;

  MovieDetailsSuccess({required this.movie});

  @override
  List<Object?> get props => [movie];
}

final class MovieDetailsFailure extends MovieDetailsState {
  final String errorMessage;

  MovieDetailsFailure(this.errorMessage);
}
