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

   // var listGenres = json['genres'] as List;

    return Movie(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
       // genres: listGenres.map((i)=> Genre.fromJson(i)).toList(),
        genreIds: json['genre_ids'],
        posterPath: json['poster_path'],
        backdropPath: json['backdrop_path'],
        releaseDate: json['release_date'],
    );
  }
}

