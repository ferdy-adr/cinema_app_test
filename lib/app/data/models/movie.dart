import 'package:cinema_app_test/app/core/const/endpoints.dart';

class Movie {
  final String id;
  final String title;
  final String image;
  final String description;

  const Movie({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: '${json["id"]}',
      title: json['title'] ?? '',
      image: json['poster_path'] != null
          ? '${Endpoints.baseImage}/${json["poster_path"]}'
          : '',
      description: json['overview'] ?? '',
    );
  }
}
