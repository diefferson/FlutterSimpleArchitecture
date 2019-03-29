import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/data/domain/movie.dart';
import 'package:flutter_clean_architecture/util/movie_image_url_builder.dart';


class HomeComponents{

  Widget listItem(Movie movie, Function onTap)=>
      GestureDetector(
        onTap: onTap,
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(tag: "cover${movie.id}",
                    transitionOnUserGestures: true,
                flightShuttleBuilder: (
                    BuildContext flightContext,
                    Animation<double> animation,
                    HeroFlightDirection flightDirection,
                    BuildContext fromHeroContext,
                    BuildContext toHeroContext,
                    ) {
                  final Hero toHero = toHeroContext.widget;
                  return RotationTransition(
                    turns: animation,
                    child: toHero.child,
                  );
                },
                    child:Image.network(MovieImageUrlBuilder.buildPosterUrl(movie.posterPath),
                  width: 80,
                  height: 100,
                  fit: BoxFit.cover,
                )),
                Expanded(
                  child:Padding(
                    padding: EdgeInsets.all(8),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(movie.title, style: TextStyle(color: Colors.black87, fontSize: 14)),
                        Text(movie.releaseDate, style: TextStyle(color: Colors.grey, fontSize: 12))
                      ]
                    )
                  )
                )
              ],
            ),
          )
      )
  );

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
