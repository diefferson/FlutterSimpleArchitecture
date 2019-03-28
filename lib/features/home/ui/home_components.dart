import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/data/domain/movie.dart';


class HomeComponents{

  Widget listItem(Movie movie)=>
      Padding( padding: EdgeInsets.symmetric(vertical: 20),child:Text(movie.title));


  Widget bottomLoader() => Container(
    alignment: Alignment.center,
    child: Center(
      child: SizedBox(
        width: 33,
        height: 33,
        child: CircularProgressIndicator(
          strokeWidth: 1.5,
        ),
      ),
    ),
  );

}
