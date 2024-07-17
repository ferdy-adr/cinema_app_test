import 'package:cinema_app_test/app/data/repository/movie_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final movieRepository = Get.find<MovieRepository>();
}
