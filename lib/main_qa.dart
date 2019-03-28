
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/app_config.dart';
import 'package:flutter_clean_architecture/app/my_app.dart';

void main() {

  var configuredApp = new AppConfig(
    environment: Environment.STAGING,
    child: MyApp(),
  );

  runApp(configuredApp);
}