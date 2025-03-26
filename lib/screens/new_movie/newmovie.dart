import 'package:flutter/material.dart';
import 'package:finalmoviediary/theme/app_colors.dart';

class NewMovieView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(leading: BackButton(), backgroundColor: Colors.transparent, elevation: 0),
    body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    _buildLabel("Título:"), _buildInput(),
    _buildLabel("Director:"), _buildInput(),
    _buildLabel("Añadir a:"),
    Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
    Chip(label: Text("Películas por ver"), backgroundColor: Colors.blue[100]),
    Chip(label: Text("Películas favoritas"), backgroundColor: Colors.pink[100])
    ]),
    _buildLabel("Notas y opiniones"),
    Container(height: 120, width: double.infinity, decoration: BoxDecoration(color: AppColors.secondary, borderRadius: BorderRadius.circular(10))),
    SizedBox(height: 20),
    Center(child: _buildSaveButton("Guardar película"))
    ]),
    ));
  }

  Widget _buildLabel(String text) {
    return Padding(padding: const EdgeInsets.only(top: 12, bottom: 4), child: Text(text, style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)));
  }

  Widget _buildInput() {
    return Container(height: 40, decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(10)));
  }

  Widget _buildSaveButton(String text) {
    return ElevatedButton(
    style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    onPressed: () {},
    child: Text(text, style: TextStyle(color: AppColors.white)));
  }
}
