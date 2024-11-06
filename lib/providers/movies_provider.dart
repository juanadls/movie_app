import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = "api.themoviedb.org";
  final String _apiKey = "86462bcf105275167165c76f625dac3d";
  final String _language = "es-ES";
  MoviesProvider() {
    getOnDisplayMovies();
  }
  getOnDisplayMovies() async {
    final url = Uri.https(
      _baseUrl,
      '/3/movie/now_playing',
      {
        'apiKey': _apiKey,
        "language": _language,
        "page": "1",
      },
    );

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print(response.body);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
