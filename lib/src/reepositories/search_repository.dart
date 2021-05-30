import 'dart:convert';

import 'package:base/src/models/search_model.dart';
import 'package:base/src/utils/api_data.dart';
import 'package:http/http.dart' as http;

class SearchRepository {
  Future<SearchModel> fetchSearch(String text) async {
    final url = Uri.parse('$URI_API/search?term=$text&$LOCALE&$API_KEY');
    final response = await http.get(url);
    print('response.body ------------------');
    print(response.body);

    if (response.statusCode == 200) {
      var prueba = jsonDecode(response.body);
      final SearchModel search = SearchModel.fromJson(prueba);

      return search;
    } else {
      throw Exception('Fallo al pedir la canción');
    }
  }
}
