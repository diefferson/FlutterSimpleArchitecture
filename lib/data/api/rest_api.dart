
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/data/domain/genre.dart';
import 'package:flutter_clean_architecture/data/domain/genre_response.dart';
import 'package:flutter_clean_architecture/data/domain/movie.dart';
import 'package:flutter_clean_architecture/data/domain/movie_response.dart';

class RestApi{

  final Dio dioClient;

  RestApi(this.dioClient);

  Map<String, String> queryParameters() => {
    'language': 'pt-Br',
  };

  Future<List<Genre>> getGenres(String code, String cpf) async{
    try {

      var response = await dioClient.get("genre/movie/list", queryParameters: queryParameters());

      if (response.statusCode == 200) {
        return GenreResponse.fromJson(response.data).genres;
      } else {
        throw Exception("error getGenres");
      }

    } catch (e) {
      throw Exception("error getGenres");
    }
  }

  Future<MovieResponse> getUpcomingMovies(int page) async {
    try {
      var response = await dioClient.get("movie/upcoming", queryParameters: queryParameters()..['page']=page.toString());

      if (response.statusCode == 200) {
        return MovieResponse.fromJson(response.data);
      } else {
        throw Exception("error getMovies");
      }

    } catch (e) {
      throw Exception("error getMovies");
    }
  }

  Future<MovieResponse> searchMovies(String query, int page) async {

    try {
      var response = await dioClient.get("search/movie",
          queryParameters: queryParameters()
                            ..['page']=page.toString()
                            ..['query']=query);

      if (response.statusCode == 200) {
        return MovieResponse.fromJson(response.data);
      } else {
        throw Exception("error searchMovies");
      }

    } catch (e) {
      throw Exception("error searchMovies");
    }
  }

  Future<Movie> getMovie(String movie) async {

    try {
      var response = await dioClient.get("movie/$movie",
          queryParameters: queryParameters());

      if (response.statusCode == 200) {
        return Movie.fromJson(response.data);
      } else {
        throw Exception("error searchMovies");
      }

    } catch (e) {
      throw Exception("error searchMovies");
    }
  }

}