

import 'package:flutter_clean_architecture/data/domain/genre.dart';

class GenreResponse{

  List<Genre> genres;

  GenreResponse({this.genres});

  factory GenreResponse.fromJson(Map<String, dynamic> json) {

    var listGenres = json['genres'] as List;

    return GenreResponse(
        genres: listGenres.map((i)=> Genre.fromJson(i)).toList(),
    );
  }
}