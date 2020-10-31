part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class MoviesInitial extends HomeState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class MoviesLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class MovieesLoadedState extends HomeState {
  final List<MovieEntity> popularesMovies;
  final List<MovieEntity> topRatedMovies;

  MovieesLoadedState(this.popularesMovies, this.topRatedMovies);
  @override
  List<Object> get props => [popularesMovies, topRatedMovies];
}
