// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../Features/auth/data/repositories/auth_repository_impl.dart'
    as _i298;
import '../../Features/auth/domain/repositories/auth_repository.dart' as _i634;
import '../../Features/auth/presentation/forget_password/cubit/forget_password_cubit.dart'
    as _i187;
import '../../Features/auth/presentation/login/cubit/login_cubit.dart' as _i980;
import '../../Features/auth/presentation/register/cubit/register_cubit.dart'
    as _i42;
import '../../Features/movie/movie_details/data/data_source_contract/movie_details_movie_remote_ds.dart'
    as _i23;
import '../../Features/movie/movie_details/data/data_source_impl/movie_details_movie_remote_impl_ds.dart'
    as _i195;
import '../../Features/movie/movie_details/data/repository/movie_details_repository_impl.dart'
    as _i323;
import '../../Features/movie/movie_details/domain/repository/movie_details_repository.dart'
    as _i163;
import '../../Features/movie/movie_details/presentation/cubit/movie_details_cubit.dart'
    as _i236;
import '../../Features/movie/tabs/browse/data/data_source/data_remote/browse_remote_ds.dart'
    as _i739;
import '../../Features/movie/tabs/browse/data/data_source/data_remote/browse_remote_ds_impl.dart'
    as _i783;
import '../../Features/movie/tabs/browse/data/repository/browse_repository_impl.dart'
    as _i134;
import '../../Features/movie/tabs/browse/domain/repository/browse_repository.dart'
    as _i707;
import '../../Features/movie/tabs/browse/presentation/cubits/browse_cubit.dart'
    as _i977;
import '../../Features/movie/tabs/home/data/data_source_contract/home_movie_local_ds.dart'
    as _i912;
import '../../Features/movie/tabs/home/data/data_source_contract/home_movie_remote_ds.dart'
    as _i312;
import '../../Features/movie/tabs/home/data/data_source_impl/home_movie_local_impl_ds.dart'
    as _i384;
import '../../Features/movie/tabs/home/data/data_source_impl/home_movie_remote_impl_ds.dart'
    as _i143;
import '../../Features/movie/tabs/home/data/repository/home_repository_impl.dart'
    as _i243;
import '../../Features/movie/tabs/home/domain/repository/home_repository.dart'
    as _i453;
import '../../Features/movie/tabs/home/presentation/home/cubits/home_cubit.dart'
    as _i482;
import '../../Features/movie/tabs/profile/edit_profile/presentation/cubit/edit_profile_cubit.dart'
    as _i1000;
import '../../Features/movie/tabs/profile/presentation/cubits/profile_cubit.dart'
    as _i61;
import '../../Features/movie/tabs/search/data/data_source_contract/search_movies_remote_ds.dart'
    as _i87;
import '../../Features/movie/tabs/search/data/data_source_impl/search_movies_remote_impl_ds.dart'
    as _i1038;
import '../../Features/movie/tabs/search/data/repository/search_repository_impl.dart'
    as _i798;
import '../../Features/movie/tabs/search/domain/repository/search_repository.dart'
    as _i92;
import '../../Features/movie/tabs/search/presentation/cubits/search_cubit.dart'
    as _i832;
import '../database/api/api_consumer.dart' as _i558;
import '../database/api/dio_consumer.dart' as _i58;
import '../database/cash/cashe_helper.dart' as _i936;
import 'dependency_injection.dart' as _i9;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i936.CacheHelper>(() => _i936.CacheHelper());
    gh.factory<_i1000.EditProfileCubit>(() => _i1000.EditProfileCubit());
    gh.factory<_i61.ProfileCubit>(() => _i61.ProfileCubit());
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.factory<_i634.AuthRepository>(() => _i298.AuthRepositoryImpl());
    gh.factory<_i187.ForgetPasswordCubit>(
        () => _i187.ForgetPasswordCubit(gh<_i634.AuthRepository>()));
    gh.factory<_i980.LoginCubit>(
        () => _i980.LoginCubit(gh<_i634.AuthRepository>()));
    gh.factory<_i42.RegisterCubit>(
        () => _i42.RegisterCubit(gh<_i634.AuthRepository>()));
    gh.factory<_i558.ApiConsumer>(() => _i58.DioConsumer(dio: gh<_i361.Dio>()));
    gh.factory<_i23.MovieDetailsRemoteDs>(
        () => _i195.MovieDetailsRemoteImplDs(gh<_i558.ApiConsumer>()));
    gh.factory<_i739.BrowseRemoteDs>(
        () => _i783.BrowseRemoteDsImpl(gh<_i558.ApiConsumer>()));
    gh.factory<_i87.SearchMoviesRemoteDs>(
        () => _i1038.SearchMoviesRemoteDsImpl(gh<_i558.ApiConsumer>()));
    gh.factory<_i312.HomeMovieRemoteDs>(
        () => _i143.HomeMovieRemoteImplDs(gh<_i558.ApiConsumer>()));
    gh.factory<_i912.HomeMovieLocalDs>(
        () => _i384.HomeMovieLocalImplDs(gh<_i558.ApiConsumer>()));
    gh.factory<_i453.HomeRepository>(
        () => _i243.HomeRepositoryImpl(gh<_i312.HomeMovieRemoteDs>()));
    gh.factory<_i163.MovieDetailsRepository>(() =>
        _i323.MovieDetailsRepositoryImpl(gh<_i23.MovieDetailsRemoteDs>()));
    gh.factory<_i92.SearchRepository>(
        () => _i798.SearchRepositoryImpl(gh<_i87.SearchMoviesRemoteDs>()));
    gh.factory<_i707.BrowseRepository>(
        () => _i134.BrowseRepositoryImpl(gh<_i739.BrowseRemoteDs>()));
    gh.factory<_i236.MovieDetailsCubit>(
        () => _i236.MovieDetailsCubit(gh<_i163.MovieDetailsRepository>()));
    gh.factory<_i832.SearchCubit>(
        () => _i832.SearchCubit(gh<_i92.SearchRepository>()));
    gh.factory<_i482.HomeCubit>(
        () => _i482.HomeCubit(gh<_i453.HomeRepository>()));
    gh.factory<_i977.BrowseCubit>(
        () => _i977.BrowseCubit(gh<_i707.BrowseRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i9.RegisterModule {}
