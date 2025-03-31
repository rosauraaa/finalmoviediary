import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/supabase_service.dart';

class NewMovieController extends GetxController {
  final titleController = TextEditingController();
  final directorController = TextEditingController();
  final notesController = TextEditingController();

  final isWatchlist = false.obs;
  final isFavorite = false.obs;

  void toggleWatchlist() => isWatchlist.value = !isWatchlist.value;
  void toggleFavorite() => isFavorite.value = !isFavorite.value;

  Future<void> saveMovie() async {
    final title = titleController.text.trim();
    final director = directorController.text.trim();
    final notes = notesController.text.trim();

    if (title.isEmpty || director.isEmpty) {
      Get.snackbar("Error", "Título y director son obligatorios");
      return;
    }

    if (!isWatchlist.value && !isFavorite.value) {
      Get.snackbar("Atención", "Selecciona al menos una categoría");
      return;
    }

    try {
      if (isWatchlist.value) {
        await SupabaseService().addToWatchlist(title, director, notes);
      }
      if (isFavorite.value) {
        await SupabaseService().addFavorite(title, director, notes);
      }

      Get.snackbar("Éxito", "Película guardada correctamente");

      titleController.clear();
      directorController.clear();
      notesController.clear();
      isWatchlist.value = false;
      isFavorite.value = false;
    } catch (e) {
      Get.snackbar("Error", "Hubo un problema al guardar: $e");
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    directorController.dispose();
    notesController.dispose();
    super.onClose();
  }
}
