import 'package:get/get.dart';
import 'newmovie_controller.dart';

class NewMovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewMovieController>(() => NewMovieController());
  }
}
