import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/Features/movie/tabs/browse/domain/repository/browse_repository.dart';
import 'package:movie_app/core/models/get_all_movie_response.dart';

part 'browse_state.dart';

class BrowseCubit extends Cubit<BrowseState> {
  BrowseRepository browseRepository;

  GetAllMovieResponse? getAllMovieResponse;

  BrowseCubit(this.browseRepository) : super(BrowseInitial());

  static BrowseCubit get(BuildContext context) =>
      BlocProvider.of<BrowseCubit>(context);

  void getAllMovies({String? genre}) async {
    emit(BrowseLoading());

    try {
      final response = await browseRepository.getAllMovies(genre: genre);
      getAllMovieResponse = response;
      emit(BrowseSuccess(genre: genre ?? "", movies: response));
    } on Exception catch (e) {
      emit(BrowseFailure(e.toString()));
    }
  }
}
