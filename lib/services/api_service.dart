// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tv_show/models/tv_show.dart';

class ApiService {
  Future<List<TvShow>> fetchTvShows(int currentPage) async {
    final response = await http.get(Uri.parse('https://www.episodate.com/api/most-popular?page=$currentPage'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      List<dynamic> tvShowsJson = jsonResponse['tv_shows'];
      return tvShowsJson.map((json) => TvShow.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load TV shows');
    }
  }
}