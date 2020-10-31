import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_gbp/domain/entities/movie_entity.dart';
import 'package:prueba_gbp/domain/usecases/get_populares_movies.dart';
import 'package:prueba_gbp/domain/usecases/get_top_rated_movies.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetPopularesMoviesUseCase getPopularesMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  HomeCubit({this.getPopularesMoviesUseCase, this.getTopRatedMoviesUseCase})
      : super(MoviesInitial());

  Future<void> getTopRatedMovies() async {
    try {
      emit(MoviesLoadingState());
      final topRatedMovies = await getTopRatedMoviesUseCase.call();
      final popularMovies = await getPopularesMoviesUseCase.call();
      emit(MovieesLoadedState(popularMovies, topRatedMovies));
    } catch (e) {
      print(e);
    }
  }
}
