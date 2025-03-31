import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';
import 'favs_controller.dart';

class FavsView extends GetView<FavsController> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _directorController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

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
          Text(
            "Películas Favoritas",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 20),

          // FORM
          Column(children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: "Título de la película",
                filled: true,
                fillColor: AppColors.secondary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _directorController,
              decoration: InputDecoration(
                hintText: "Director",
                filled: true,
                fillColor: AppColors.secondary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _notesController,
              decoration: InputDecoration(
                hintText: "Notas",
                filled: true,
                fillColor: AppColors.secondary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary),
              onPressed: () {
                final title = _textController.text.trim();
                final director = _directorController.text.trim();
                final notes = _notesController.text.trim();
                if (title.isNotEmpty) {
                  controller.addFavorite(title, director, notes);
                  _textController.clear();
                  _directorController.clear();
                  _notesController.clear();
                }
              },
              child: Text("Agregar", style: TextStyle(color: AppColors.white)),
            ),
          ]),

          SizedBox(height: 20),

          // LISTA
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.favorites.length,
              itemBuilder: (context, index) {
                final item = controller.favorites[index];
                final id = item['id'];
                final title = item['title'];
                final director = item['director'] ?? '';
                final notes = item['notes'] ?? '';

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(title, style: TextStyle(fontSize: 16, color: AppColors.black)),
                              SizedBox(height: 4),
                              Text("Director: $director", style: TextStyle(fontSize: 14, color: AppColors.black)),
                              SizedBox(height: 2),
                              Text("Notas: $notes", style: TextStyle(fontSize: 14, color: AppColors.black)),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: AppColors.black),
                          onPressed: () => controller.deleteFavorite(id),
                        )
                      ],
                    ),
                  ),
                );
              },
            )),
          ),
        ]),
      ),
    );
  }
}
