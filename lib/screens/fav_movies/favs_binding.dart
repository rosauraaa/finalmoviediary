import 'package:get/get.dart';
import 'favs_controller.dart';

class FavsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavsController>(() => FavsController());
  }
}
