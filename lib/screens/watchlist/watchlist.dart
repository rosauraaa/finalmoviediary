import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';
import 'watchlist_controller.dart';

class WatchlistView extends GetView<WatchlistController> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController directorController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: BackButton(color: AppColors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Películas por ver", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.primary)),
          SizedBox(height: 20),

          _buildTextField("Nombre", titleController),
          _buildTextField("Director", directorController),
          _buildTextField("Notas", notesController),

          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            onPressed: () {
              final title = titleController.text.trim();
              final director = directorController.text.trim();
              final notes = notesController.text.trim();

              if (title.isNotEmpty && director.isNotEmpty) {
                controller.addMovie(title, director, notes);
                titleController.clear();
                directorController.clear();
                notesController.clear();
              } else {
                Get.snackbar("Error", "Completa todos los campos obligatorios");
              }
            },
            child: Text("Agregar", style: TextStyle(color: AppColors.white)),
          ),

          SizedBox(height: 20),
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.movies.length,
              itemBuilder: (context, index) {
                final item = controller.movies[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Dismissible(
                    key: ValueKey(item['id']),
                    background: Container(
                      color: Colors.green,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(Icons.check, color: Colors.white),
                    ),
                    direction: DismissDirection.startToEnd,
                    onDismissed: (_) => controller.removeMovie(item['id']),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
               Text(item['title'], style: TextStyle(color: AppColors.black, fontSize: 16, fontWeight: FontWeight.bold)),
               Text("Director: ${item['director']}", style: TextStyle(color: AppColors.black)),
               Text("Notas: ${item['notes']}", style: TextStyle(color: AppColors.black)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )),
          )
        ]),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: AppColors.secondary,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
        ),
      ),
    );
  }
}



