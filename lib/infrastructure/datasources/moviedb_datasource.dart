import 'package:dio/dio.dart';
import 'package:cinemapedia_220219/config/constants/environment.dart';
import 'package:cinemapedia_220219/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_220219/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia_220219/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:cinemapedia_220219/domain/entities/movie.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    headers: {
      'Authorization': 'Bearer ${Environment.theMovieDbKey}',
      'Content-Type': 'application/json;charset=utf-8',
    },
    queryParameters: {
      'language': 'es-MX',
    },
  ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    // print(' Solicitando películas');
    try {
      final response = await dio.get('/movie/now_playing');
      // print(' Respuesta recibida de TMDB');
      // print(response.data); // opcional

      final movieDBResponse = MovieDbResponse.fromJson(response.data);

      final List<Movie> movies = movieDBResponse.results
          .where((moviedb) =>
              moviedb.posterPath != null && moviedb.posterPath!.isNotEmpty)
          .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
          .toList();

      //print('Películas obtenidas: ${movies.length}');
      return movies;
    } catch (e) {
      //print('Error al obtener películas: $e');
      return [];
    }
  }
}
