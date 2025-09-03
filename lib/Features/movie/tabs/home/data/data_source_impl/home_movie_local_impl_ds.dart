import 'package:injectable/injectable.dart';
import 'package:movie_app/Features/movie/tabs/home/data/data_source_contract/home_movie_local_ds.dart';
import 'package:movie_app/core/database/cash/cash_helper.dart';
import 'package:movie_app/core/models/get_all_movie_response.dart';

@Injectable(as: HomeMovieLocaleDs)
class HomeMovieLocalImplDs extends HomeMovieLocaleDs {
  static const String availableMoviesBox = "availableMoviesBox";
  static const String keyAvailableMovies = "keyAvailableMovies";
  static const String genresMoviesBox = "genresMoviesBox";
  static const String keyGenresMovies = "keyGenresMovies";

  @factoryMethod
  HomeMovieLocalImplDs();

  @override
  Future<GetAllMovieResponse?> getData() async {
    return await CashHelper.getData<GetAllMovieResponse>(
      boxName: availableMoviesBox,
      key: keyAvailableMovies,
    );
  }

  @override
  Future<void> saveData({
    required GetAllMovieResponse? getAllMovieResponse,
  }) async {
    await CashHelper.saveData<GetAllMovieResponse?>(
      boxName: availableMoviesBox,
      key: keyAvailableMovies,
      value: getAllMovieResponse,
    );
  }

  @override
  Future<GetAllMovieResponse?> getDataByGenre(String genre) async {
    return await CashHelper.getData<GetAllMovieResponse>(
      boxName: genresMoviesBox,
      key: keyGenresMovies,
    );
  }

  @override
  Future<void> saveDataByGenre({
    required String genre,
    required GetAllMovieResponse getAllMovieResponse,
  }) async {
    await CashHelper.saveData<GetAllMovieResponse>(
      boxName: genresMoviesBox,
      key: keyGenresMovies,
      value: getAllMovieResponse,
    );
  }
}
