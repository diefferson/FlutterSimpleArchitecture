
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app_config.dart';
import 'package:flutter_clean_architecture/my_app.dart';

void main() {

  var configuredApp = new AppConfig(
    environment: Environment.DEV,
    child:MyApp(),
  );

  runApp(configuredApp);

}