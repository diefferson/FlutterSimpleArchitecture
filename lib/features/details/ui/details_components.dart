

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/util/movie_image_url_builder.dart';

class DetailsComponents {

  SliverAppBar buildSliverAppBar(String movieBackdropPath) {
    return SliverAppBar(
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
//          title: Text(widget.movie.title,
//              style: TextStyle(
//                color: Colors.white,
//                fontSize: 16.0,
//              )
//          ),
          background: Image.network(MovieImageUrlBuilder.buildBackdropUrl(movieBackdropPath), fit: BoxFit.cover)
      ),
    );
  }

}