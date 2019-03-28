
import 'package:flutter_clean_architecture/data/api/rest_api.dart';
import 'package:flutter_clean_architecture/data/domain/movie_response.dart';

class HomeRepository{

  final RestApi _restApi;

  HomeRepository(this._restApi);

  Future<MovieResponse> getUpcomingMovies(int page){
    return _restApi.getUpcomingMovies(page);
  }

}