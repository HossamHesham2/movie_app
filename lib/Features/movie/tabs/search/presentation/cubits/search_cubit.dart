import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/movie/tabs/search/domain/repository/search_repository.dart';
import 'package:movie_app/core/models/get_all_movie_response.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepository) : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of<SearchCubit>(context);
  final TextEditingController searchController = TextEditingController();
  SearchRepository searchRepository;

  GetAllMovieResponse? getAllMovieResponse;

  void getAvailableNowMovies() async {
    try {
      emit(SearchLoading());
      final movies = await searchRepository.getAllMovies();
      getAllMovieResponse = movies;
      List<Movies> moviesList = movies?.data?.movies ?? [];
      emit(SearchSuccess(moviesList: moviesList));
    } on Exception catch (e) {
      emit(SearchFailure(errorMessage: e.toString()));
    }
  }
}
