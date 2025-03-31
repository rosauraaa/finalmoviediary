import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';
import 'register_controller.dart';

class RegisterView extends GetView<RegisterController> {
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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("MovieDiary",
                style: TextStyle(
                    fontSize: 28,
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("Crea tu cuenta",
                style: TextStyle(fontSize: 18, color: AppColors.black)),
            SizedBox(height: 32),
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(
                hintText: 'correo electrónico',
                filled: true,
                fillColor: AppColors.secondary,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'contraseña',
                filled: true,
                fillColor: AppColors.secondary,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: controller.confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'confirmar contraseña',
                filled: true,
                fillColor: AppColors.secondary,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: controller.register,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text('Registrarse',
                  style: TextStyle(color: AppColors.white)),
            ),
            SizedBox(height: 40),
            Text("Ya tienes cuenta?",
                style: TextStyle(color: AppColors.black)),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => Get.toNamed('/login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: Text("Ingresar", style: TextStyle(color: AppColors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
