import 'package:flutter_clean_architecture/data/domain/genre.dart';

class Movie{
  int id;
  String title;
  String overview;
  List<Genre> genres;
  List<dynamic> genreIds;
  String posterPath;
  String backdropPath;
  String releaseDate;

  Movie({this.id, this.title, this.overview, this.genres, this.genreIds,
        this.posterPath, this.backdropPath, this.releaseDate });

  factory Movie.fromJson(Map<String, dynamic> json) {

    return Movie(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        genreIds: json['genre_ids'],
        posterPath: json['poster_path'],
        backdropPath: json['backdrop_path'],
        releaseDate: json['release_date'],
    );
  }
}

