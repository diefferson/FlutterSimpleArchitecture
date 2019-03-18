
import 'package:flutter/material.dart';

enum Environment { DEV, STAGING, PROD }

class AppConfig extends InheritedWidget{

  AppConfig({@required this.environment, @required Widget child}) : super(child: child);

  final Environment environment;
  
  get appName => _config[_Config.APP_NAME];
  get flavorName => _config[_Config.APP_NAME];
  get apiBaseUrl => _config[_Config.API_BASE_URL];

  get _config {
    switch (environment) {
      case Environment.DEV:
        return _Config.debugConstants;
        break;
      case Environment.STAGING:
        return _Config.qaConstants;
        break;
      case Environment.PROD:
        return _Config.prodConstants;
        break;
    }
  }

  static AppConfig of(BuildContext context){
    return context.inheritFromWidgetOfExactType(AppConfig);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) =>false ;

}

class _Config {

  static const API_BASE_URL = "API_BASE_URL";
  static const APP_NAME = "APP_NAME";
  static const FLAVOR_NAME = "FLAVOR_NAME";

  static Map<String, dynamic> debugConstants = {
    API_BASE_URL: "https://api.themoviedb.org/3/",
    APP_NAME: "Flutter Simple Architecure DEV",
    FLAVOR_NAME: "dev",
  };

  static Map<String, dynamic> qaConstants = {
    API_BASE_URL: "https://api.themoviedb.org/3/",
    APP_NAME: "Flutter Simple Architecure QA",
    FLAVOR_NAME: "qa",
  };

  static Map<String, dynamic> prodConstants = {
    API_BASE_URL: "https://api.themoviedb.org/3/",
    APP_NAME: "Flutter Simple Architecure PROD",
    FLAVOR_NAME: "prod",
  };
}