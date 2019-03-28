
import 'package:flutter_clean_architecture/data/domain/movie.dart';

class MovieResponse{

    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    MovieResponse({this.page, this.results, this.totalPages, this.totalResults});

    factory MovieResponse.fromJson(Map<String, dynamic> json) {

      var listMovies = json['results'] as List;

      return MovieResponse(
        page: json['page'],
        results: listMovies.map((i)=> Movie.fromJson(i)).toList(),
        totalPages: json['total_pages'],
        totalResults: json['total_results'],
      );
    }
}