import 'package:get/get.dart';
import '../../services/supabase_service.dart';

class FavsController extends GetxController {
  final favorites = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final data = await SupabaseService().getFavorites();
    favorites.assignAll(data);
  }

  Future<void> addFavorite(String title) async {
    await SupabaseService().addFavorite(title);
    loadFavorites();
  }

  Future<void> deleteFavorite(String id) async {
    await SupabaseService().deleteFavorite(id);
    loadFavorites();
  }
}
