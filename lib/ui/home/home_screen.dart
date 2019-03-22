import 'package:flutter/material.dart';
import 'package:flutter_bloc_inject/flutter_bloc_inject.dart';
import 'package:flutter_clean_architecture/res/app-strings.dart';
import 'package:flutter_clean_architecture/ui/home/home_bloc.dart';

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  HomeBloc _bloc;

  @override
  Widget build(BuildContext context) {

    _bloc = Injector.getInjector().getBloc<HomeBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_bloc.getHomeName()),
          ],
        ),
      ),
    );
  }
}
