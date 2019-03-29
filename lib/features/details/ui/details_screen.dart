
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/data/domain/movie.dart';
import 'package:flutter_clean_architecture/features/details/ui/details_components.dart';
import 'package:flutter_clean_architecture/util/movie_image_url_builder.dart';

class DetailsScreen extends StatefulWidget{

  final Movie movie;

  const DetailsScreen({Key key, this.movie}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DetailsScreenState();
}

class DetailsScreenState extends State<DetailsScreen> with DetailsComponents{

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              buildSliverAppBar(widget.movie.backdropPath),
            ];
          },
          body: Padding(
            padding: EdgeInsets.all(10),
            child:Container(
              child:Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Hero(tag: "cover${widget.movie.id}",
                            transitionOnUserGestures: true,
                            child: Image.network(MovieImageUrlBuilder.buildPosterUrl(widget.movie.posterPath),
                        width: 150,
                        height: 170,
                        fit: BoxFit.cover,
                      )),
                      Expanded(
                          child:Padding(
                              padding: EdgeInsets.all(8),
                              child:Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(widget.movie.title, style: TextStyle(color: Colors.black87, fontSize: 14)),
                                    Text(widget.movie.releaseDate, style: TextStyle(color: Colors.grey, fontSize: 12))
                                  ]
                              )
                          )
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10), child: Text(widget.movie.overview))
                ]
              )
            ),
          )
        ),
      );
  }
}