import 'package:get/get.dart';

class HomeController extends GetxController {
  // Nombre de usuario que se muestra en el título
  final username = 'Usuario'.obs;

  @override
  void onInit() {
    super.onInit();
    // Aquí podrías cargar dinámicamente el nombre desde Supabase o algún otro origen
    // username.value = 'Nombre dinámico';
  }
}


