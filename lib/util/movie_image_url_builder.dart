

import 'package:flutter_clean_architecture/app/app_config.dart';
import 'package:flutter_clean_architecture/app/app_injector.dart';

class MovieImageUrlBuilder {

  static const _POSTER_URL = "https://image.tmdb.org/t/p/w154";
  static const _BACKDROP_URL = "https://image.tmdb.org/t/p/w780";

  static String buildPosterUrl(String posterPath) {
      if(posterPath != null){
        return _POSTER_URL + posterPath + "?api_key=" + AppInjector.getInjector().get<AppConfig>().apiKey;
      }
      return "";
  }

  static String buildBackdropUrl(String backdropPath)  {
      if(backdropPath != null ){
          return _BACKDROP_URL + backdropPath + "?api_key=" + AppInjector.getInjector().get<AppConfig>().apiKey;
      }
      return "";
  }
}