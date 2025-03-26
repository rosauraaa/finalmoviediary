import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';
import 'reviews_controller.dart';

class ReviewsView extends GetView<ReviewsController> {
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
          Text("Mis Reseñas", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.primary)),
          SizedBox(height: 20),

          // Formulario para nueva reseña
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: "Escribe tu reseña",
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
                    controller.addReview(text);
                    _textController.clear();
                  }
                },
                child: Text("Agregar", style: TextStyle(color: AppColors.white)),
              )
            ],
          ),

          SizedBox(height: 20),

          // Lista reactiva de reseñas
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.reviews.length,
              itemBuilder: (context, index) {
                final review = controller.reviews[index];
                final id = review['id'];
                final content = review['content'];

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
                        Expanded(child: Text(content, style: TextStyle(color: AppColors.black, fontSize: 16))),
                        IconButton(
                          icon: Icon(Icons.delete, color: AppColors.black),
                          onPressed: () => controller.deleteReview(id),
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
