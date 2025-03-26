import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';
import '../../theme/app_colors.dart';
import '../../routes/app_routes.dart';

class HomeView extends GetView<HomeController> { //usamos el controlador directamente 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: AppColors.white,
    appBar: AppBar(
    title: Text("MovieDiary", style: TextStyle(color: AppColors.primary, fontSize: 28, fontWeight: FontWeight.bold)),
    centerTitle: false,
    backgroundColor: Colors.transparent,
    elevation: 0),
    body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    _buildMainButton("Mis Reseñas", AppRoutes.REVIEWS),
    _buildMainButton("Películas por Ver", AppRoutes.WATCHLIST),
    _buildMainButton("Películas Favoritas", AppRoutes.FAVS),
    ]),
    //perfil
    Column(children: [
    Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(color: AppColors.secondary, borderRadius: BorderRadius.circular(12)),
    child: Center(child: Text("foto de perfil"))),
    SizedBox(height: 8),
    _buildSmallButton("Mi perfil")
    ])
    ]),
    SizedBox(height: 20),
    // nueva peli
    Center(child: _buildBigButton("Agregar nueva película", AppRoutes.NEWMOVIE)),
    SizedBox(height: 20),
    Text("Reseñas", style: TextStyle(color: AppColors.primary, fontSize: 22, fontWeight: FontWeight.bold)),
    SizedBox(height: 10),
    Container(
    padding: EdgeInsets.all(12),
    width: double.infinity,
    decoration: BoxDecoration(color: AppColors.secondary, borderRadius: BorderRadius.circular(10)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text("Nombre de la película:"),
    Text("Autor:"),
    Text("Género:"),
    Text("Reseña:")
    ])),
    SizedBox(height: 10),
    Center(child: _buildBigButton("Agregar reseña")),
    SizedBox(height: 20),
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
    Text(
    "Mapa de eventos",
    style: TextStyle(fontSize: 16, color: AppColors.black),
    ),
    ],
    ),
    )
    ]),
    ),
    );
  }

  //funcion para construir un boton grande para toda la app con una estructura para no estar reescribiendo el codigo
  Widget _buildBigButton(String text, [String? route]) {
    return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    ),
    onPressed: () {
      if (route != null) Get.toNamed(route);
    },
    child: Text(text, style: TextStyle(color: AppColors.white)),
  );
}

  // lo mismo pero para botones pequenos
  Widget _buildSmallButton(String text) {
    return ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.accent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6)),
    onPressed: () {},
    child: Text(text, style: TextStyle(color: AppColors.black)));
  }

  //nos llevan a cada seccion clave de la app como son pelis favs, reseñas y pelis por ver
  Widget _buildMainButton(String text, String route) {
    return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      onPressed: () => Get.toNamed(route),
      child: Text(text, style: TextStyle(color: AppColors.black)),
    ),
  );
}
}
