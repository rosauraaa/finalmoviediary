import 'package:get/get.dart';
import '../../services/supabase_service.dart';

class ReviewsController extends GetxController {
  final reviews = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadReviews();
  }

  Future<void> loadReviews() async {
    final data = await SupabaseService().getReviews();
    reviews.assignAll(data);
  }

  Future<void> addReview(String content) async {
    await SupabaseService().addReview(content);
    loadReviews();
  }

  Future<void> deleteReview(String id) async {
    await SupabaseService().deleteReview(id);
    loadReviews();
  }
}
