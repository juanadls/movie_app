import 'dart:convert';

import 'package:movie_app/models/movie.dart';

class PopularResponse {
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  PopularResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PopularResponse.fromRawJson(String str) =>
      PopularResponse.fromJson(json.decode(str));

  factory PopularResponse.fromJson(Map<String, dynamic> json) =>
      PopularResponse(
        page: json["page"],
        results:
            List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

enum OriginalLanguage { en, es, fr, tl }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.en,
  "es": OriginalLanguage.es,
  "fr": OriginalLanguage.fr,
  "tl": OriginalLanguage.tl
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
