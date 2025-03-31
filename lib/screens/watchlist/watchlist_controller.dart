import 'package:get/get.dart';
import '../../services/supabase_service.dart';

class WatchlistController extends GetxController {
  final movies = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMovies();
  }

  Future<void> loadMovies() async {
    final data = await SupabaseService().getWatchlist();
    movies.assignAll(data);
  }

  Future<void> addMovie(String title, String director, String notes) async {
    await SupabaseService().addToWatchlist(title, director, notes);
    loadMovies();
  }

  Future<void> removeMovie(String id) async {
    await SupabaseService().deleteFromWatchlist(id);
    loadMovies();
  }
}

