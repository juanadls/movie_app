import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:movie_app/models/now_playing_response.dart';

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
      if (response.body.isNotEmpty) {
        final playingResponse =
            NowPlayingResponse.fromJson(response.body as Map<String, dynamic>);
      }
    } else {}
  }
}
