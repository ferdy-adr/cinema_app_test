import 'package:cinema_app_test/app/core/const/endpoints.dart';
import 'package:cinema_app_test/app/data/models/movie.dart';
import 'package:cinema_app_test/app/data/repository/movie_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MovieRepositoryImpl extends MovieRepository {
  final Dio client;

  MovieRepositoryImpl({
    required this.client,
  });

  @override
  Future<List<Movie>> getMovies() async {
    try {
      final apiKey =
          dotenv.env['API_KEY'] ?? const String.fromEnvironment('API_KEY');

      final response = await client.get(
        Endpoints.getMovies,
        options: Options(
          headers: {
            'Authorization': 'Bearer $apiKey',
          },
        ),
      );

      var data = response.data;

      if (data['results'] is List) {
        final List tempMovies = data['results'];

        return tempMovies.map((e) => Movie.fromJson(e)).toList();
      } else {
        return [];
      }
    } on DioException catch (e) {
      throw Exception('Error ${e.response?.statusCode}');
    } catch (e) {
      throw Exception('Unhandled Exception');
    }
  }
}
