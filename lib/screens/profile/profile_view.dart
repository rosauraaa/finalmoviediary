import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../theme/app_colors.dart';
import 'profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: BackButton(color: AppColors.black),
        title: Text("Mi Perfil", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Obx(() {
            final file = controller.imageFile.value;
            return Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(16),
                image: file != null
                    ? DecorationImage(image: FileImage(file), fit: BoxFit.cover)
                    : null,
              ),
              child: file == null
                  ? Center(child: Text("Foto de perfil", style: TextStyle(color: AppColors.black)))
                  : null,
            );
          }),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => controller.pickImage(ImageSource.camera),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            child: Text("Tomar Foto", style: TextStyle(color: AppColors.white)),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => controller.pickImage(ImageSource.gallery),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent),
            child: Text("Elegir de galería", style: TextStyle(color: AppColors.black)),
          ),
        ]),
      ),
    );
  }
}
