import 'package:cinema_app_test/app/data/repository/movie_repository.dart';
import 'package:cinema_app_test/app/data/repository_impl/movie_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<MovieRepository>(
      () => MovieRepositoryImpl(
        client: Get.find<Dio>(),
      ),
    );
  }
}
