import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/data/domain/movie.dart';
import 'package:flutter_clean_architecture/features/home/di/home_injector.dart';
import 'package:flutter_clean_architecture/features/home/ui/home_bloc.dart';
import 'package:flutter_clean_architecture/features/home/ui/home_components.dart';

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with HomeComponents{

  HomeBloc _bloc;
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
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
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: StreamBuilder(
            stream: _bloc.outMovies,
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
        return index+1 >= (_bloc.currentPage*20) ? bottomLoader() : listItem(movie);
      },
      itemCount: _bloc.hasReachedMax ? _bloc.totalResults:(_bloc.currentPage*20),
      controller: _scrollController,
    );
  }
}

