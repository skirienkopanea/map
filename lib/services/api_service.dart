import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category.dart';
import '../models/marker_data.dart';

class ApiService {
  static Future<List<Category>> fetchCategories(String languageId, int categoryId) async {
    final url = 'https://app.flamencos.eu/api/get_categories.php?lang=$languageId&category_id=$categoryId';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) throw Exception('Failed to load categories');
    final List data = json.decode(response.body);
    return data.map((e) => Category.fromJson(e)).toList();
  }

  static Future<List<MarkerData>> fetchMarkers(String languageId, int categoryId) async {
    final url = 'https://app.flamencos.eu/api/get_markers.php?lang=$languageId&category_id=$categoryId';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) throw Exception('Failed to load markers');
    final List data = json.decode(response.body);
    return data.map((e) => MarkerData.fromJson(e)).toList();
  }

  static Future<List<MarkerData>> searchMarkers(String languageId, int categoryId, String searchTerm) async {
  final uri = Uri.parse('https://app.flamencos.eu/api/get_search_results.php').replace(queryParameters: {
    'lang': languageId.toString(),
    'category_id': categoryId.toString(),
    'search_term': searchTerm,
  });

  final response = await http.get(uri);
  if (response.statusCode != 200) throw Exception('Failed to search markers');
  final List data = json.decode(response.body);
  return data.map((e) => MarkerData.fromJson(e)).toList();
}

}