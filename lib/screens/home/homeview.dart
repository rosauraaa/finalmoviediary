import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';
import '../../routes/app_routes.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text("MovieDiary", style: TextStyle(color: AppColors.primary, fontSize: 28, fontWeight: FontWeight.bold)),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Botones principales
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMainButton("Mis Reseñas", AppRoutes.REVIEWS),
                    _buildMainButton("Películas por Ver", AppRoutes.WATCHLIST),
                    _buildMainButton("Películas Favoritas", AppRoutes.FAVS),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    SizedBox(height: 8),
                    _buildSmallButton("Mi perfil", AppRoutes.PROFILE),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            Center(child: _buildBigButton("Agregar nueva película", AppRoutes.NEWMOVIE)),
            SizedBox(height: 20),

            Text("Reseñas", style: TextStyle(color: AppColors.primary, fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),

            Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nombre de la película:"),
                  Text("Autor:"),
                  Text("Género:"),
                  Text("Reseña:"),
                ],
              ),
            ),
            SizedBox(height: 10),
            Center(child: _buildBigButton("Agregar reseña", AppRoutes.REVIEWS)),

            SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(Icons.map, size: 40, color: AppColors.white),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Mapa de cines", style: TextStyle(fontSize: 16, color: AppColors.black)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainButton(String text, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ElevatedButton(
        onPressed: () => Get.toNamed(route),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
        child: Text(text, style: TextStyle(color: AppColors.black)),
      ),
    );
  }

  Widget _buildSmallButton(String text, String route) {
    return ElevatedButton(
      onPressed: () => Get.toNamed(route),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
      child: Text(text, style: TextStyle(color: AppColors.black)),
    );
  }

  Widget _buildBigButton(String text, [String? route]) {
    return ElevatedButton(
      onPressed: () {
        if (route != null) Get.toNamed(route);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: Text(text, style: TextStyle(color: AppColors.white)),
    );
  }
}
