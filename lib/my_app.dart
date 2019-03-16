import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app_config.dart';
import 'package:flutter_clean_architecture/ui/home/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var config = AppConfig.of(context);

    return MaterialApp(
      title: config.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: config.appName),
    );
  }
}
