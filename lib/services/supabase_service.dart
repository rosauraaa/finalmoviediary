import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final SupabaseService _instance = SupabaseService._internal();
  factory SupabaseService() => _instance;
  SupabaseService._internal();

  final SupabaseClient client = Supabase.instance.client;

  static Future<void> init() async {
    await Supabase.initialize(
      url: 'https://uxbthqddvgvtgdpmaudu.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV4YnRocWRkdmd2dGdkcG1hdWR1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI0MjU0MjMsImV4cCI6MjA1ODAwMTQyM30.oSs0Rlx6l1TKTzGmn0sspCzMsld-T0RtPmVnajlaD2w',
    );
  }

  // ========== WATCHLIST ==========

  Future<List<Map<String, dynamic>>> getWatchlist() async {
    final response = await client.from('watchlist').select('id, title, director, notes');
    return (response as List).cast<Map<String, dynamic>>();
  }

  Future<void> addToWatchlist(String title, String director, String notes) async {
    await client.from('watchlist').insert({
      'title': title,
      'director': director,
      'notes': notes,
    });
  }

  Future<void> deleteFromWatchlist(String id) async {
    await client.from('watchlist').delete().eq('id', id);
  }

  // ========== REVIEWS ==========

  Future<List<Map<String, dynamic>>> getReviews() async {
    final response = await client.from('reviews').select('id, content');
    return (response as List).cast<Map<String, dynamic>>();
  }

  Future<void> addReview(String content) async {
    await client.from('reviews').insert({'content': content});
  }

  Future<void> deleteReview(String id) async {
    await client.from('reviews').delete().eq('id', id);
  }

  // ========== FAVORITES ==========

  Future<List<Map<String, dynamic>>> getFavorites() async {
    final response = await client.from('favorites').select('id, title, director, notes');
    return (response as List).cast<Map<String, dynamic>>();
  }

  Future<void> addFavorite(String title, String director, String notes) async {
  await client.from('favorites').insert({
    'title': title,
    'director': director,
    'notes': notes,
  });
}



  Future<void> deleteFavorite(String id) async {
    await client.from('favorites').delete().eq('id', id);
  }
}



