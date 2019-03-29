import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/data/domain/movie.dart';
import 'package:flutter_clean_architecture/features/details/ui/details_screen.dart';
import 'package:flutter_clean_architecture/features/home/di/home_injector.dart';
import 'package:flutter_clean_architecture/features/home/ui/home_bloc.dart';
import 'package:flutter_clean_architecture/features/home/ui/home_components.dart';
import 'package:flutter_clean_architecture/res/app-strings.dart';
import 'package:flutter_clean_architecture/util/slide_left_transition.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with HomeComponents{

  HomeBloc _bloc;
  final _scrollController = ScrollController();

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= 0) {
      _bloc.fetchMovies();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = HomeInjector.getInjector().getBloc<HomeBloc>(context);
    _scrollController.addListener(_onScroll);
    _bloc.fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.of(context).title)),
      body: Center(
        child: StreamBuilder(
            stream: _bloc.movies,
            builder: (buildContext, snapshot){
              if (snapshot.hasData) {
                return moviesList(snapshot);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            }
        ),
      ),
    );
  }

  ListView moviesList(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        var movie = snapshot.data[index] as Movie;
        return index+1 >= (_bloc.currentPage*20) ? bottomLoader() : listItem(movie, (){ _goToDeTails(movie); });
      }, 
      itemCount: _bloc.hasReachedMax ? _bloc.totalResults:(_bloc.currentPage*20),
      controller: _scrollController,
    );
  }

  _goToDeTails(Movie movie){
    Navigator.push(
      context,
      SlideLeftRoute( widget :DetailsScreen(movie: movie) ),
    );
  }
}

