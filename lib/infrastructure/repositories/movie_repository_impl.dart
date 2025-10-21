import 'package:cinemapedia_220219/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_220219/domain/entities/movie.dart';
import 'package:cinemapedia_220219/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;
  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}
