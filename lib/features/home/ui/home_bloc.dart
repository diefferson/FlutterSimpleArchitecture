import 'package:flutter_bloc_inject/flutter_bloc_inject.dart';
import 'package:flutter_clean_architecture/data/domain/movie.dart';
import 'package:flutter_clean_architecture/features/home/repository/home_repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends Bloc{

  final HomeRepository _repository;

  HomeBloc(this._repository);

  int currentPage = 0;
  int totalResults = 0;
  bool hasReachedMax = false;

  BehaviorSubject<List<Movie>> _movies = new BehaviorSubject();
  get outMovies => _movies.stream;

  void fetchMovies() async{
      var moviesResponse = await _repository.getUpcomingMovies(currentPage+1);
      totalResults = moviesResponse.totalResults;
      currentPage = moviesResponse.page;
      hasReachedMax = currentPage == moviesResponse.totalPages;
      if(outMovies.value == null){
        _movies.sink.add(moviesResponse.results);
      }else{
        _movies.sink.add(outMovies.value..addAll(moviesResponse.results));
      }
  }

  @override
  void dispose() {
    _movies.close();
    super.dispose();
  }

}