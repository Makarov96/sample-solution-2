
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_gbp/data/data_source/movies_remote_data_source.dart';
import 'package:prueba_gbp/data/data_source/movies_remote_data_source_impl.dart';
import 'package:prueba_gbp/data/repositories/movies_repository_impl.dart';
import 'package:prueba_gbp/domain/repositories/movies_repository.dart';
import 'package:prueba_gbp/domain/usecases/get_populares_movies.dart';
import 'package:prueba_gbp/domain/usecases/get_top_rated_movies.dart';
import 'package:prueba_gbp/presentation/blocs/home_bloc/home_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {

  //Futures bloc 
  sl.registerFactory<HomeCubit>(() => HomeCubit(
    getPopularesMoviesUseCase: sl.call(),
    getTopRatedMoviesUseCase: sl.call()
  ));

  //use cases
  sl.registerLazySingleton<GetPopularesMoviesUseCase>(() => GetPopularesMoviesUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetTopRatedMoviesUseCase>(() => GetTopRatedMoviesUseCase(repository: sl.call()));

  //repository
  sl.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(remoteDataSource: sl.call()));

  //remote data
  sl.registerLazySingleton<MoviesRemoteDataSource>(() => MoviesRemoteDataSourceImpl(client: sl.call()));

  //external

  sl.registerLazySingleton(() => http.Client());

}