
import 'package:flutter/material.dart';

enum Environment { DEV, STAGING, PROD }

class AppConfig extends InheritedWidget{

  final Environment environment;

  AppConfig({@required this.environment, @required Widget child}) : super(child: child);

  get _config => _Config.getConfig(environment);

  get appName => _config[_Config.APP_NAME];
  get flavorName => _config[_Config.APP_NAME];
  get apiBaseUrl => _config[_Config.API_BASE_URL];
  get apiKey => _config[_Config.API_KEY];

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
  static const API_KEY = "API_KEY";

  static Map<String, dynamic> debugConstants = {
    API_BASE_URL: "https://api.themoviedb.org/3/",
    APP_NAME: "Flutter Simple Architecure DEV",
    FLAVOR_NAME: "dev",
    API_KEY: "1f54bd990f1cdfb230adb312546d765d"
  };

  static Map<String, dynamic> qaConstants = {
    API_BASE_URL: "https://api.themoviedb.org/3/",
    APP_NAME: "Flutter Simple Architecure QA",
    FLAVOR_NAME: "qa",
    API_KEY: "4bb78f6ddc409a61cdc84e2b3cde2974"
  };

  static Map<String, dynamic> prodConstants = {
    API_BASE_URL: "https://api.themoviedb.org/3/",
    APP_NAME: "Flutter Simple Architecure PROD",
    FLAVOR_NAME: "prod",
    API_KEY: "4bb78f6ddc409a61cdc84e2b3cde2974"
  };

  static getConfig(Environment environment) {
    switch (environment) {
      case Environment.DEV:
        return _Config.debugConstants;
      case Environment.STAGING:
        return _Config.qaConstants;
      case Environment.PROD:
        return _Config.prodConstants;
    }
  }
}