import 'package:cinema_app_test/app/data/models/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies();
}
