import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';
import 'favs_controller.dart';

class FavsView extends GetView<FavsController> {
  final TextEditingController _textController = TextEditingController();

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
          Text("Películas Favoritas", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.primary)),
          SizedBox(height: 20),

          // Formulario para nueva favorita
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: "Nombre de la película",
                    filled: true,
                    fillColor: AppColors.secondary,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  ),
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                onPressed: () {
                  final text = _textController.text.trim();
                  if (text.isNotEmpty) {
                    controller.addFavorite(text);
                    _textController.clear();
                  }
                },
                child: Text("Agregar", style: TextStyle(color: AppColors.white)),
              )
            ],
          ),

          SizedBox(height: 20),

          // Lista reactiva
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.favorites.length,
              itemBuilder: (context, index) {
                final item = controller.favorites[index];
                final id = item['id'];
                final title = item['title'];

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
                        Text(title, style: TextStyle(color: AppColors.black, fontSize: 16)),
                        IconButton(
                          icon: Icon(Icons.delete, color: AppColors.black),
                          onPressed: () => controller.deleteFavorite(id),
                        ),
                      ],
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
}
