import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import '../../theme/app_colors.dart';
import 'map_controller.dart';

class MapView extends GetView<MapController> {
  GoogleMapController? _mapController;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Mapa de cines",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.black),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Obx(() {
                  final position = controller.currentPosition.value;
                  if (position == null) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(position.latitude, position.longitude),
                      zoom: 14,
                    ),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    onMapCreated: (controllerMap) => _mapController = controllerMap,
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
