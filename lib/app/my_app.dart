import 'package:flutter/material.dart';
import 'package:flutter_bloc_inject/flutter_bloc_inject.dart';
import 'package:flutter_clean_architecture/app/app_config.dart';
import 'package:flutter_clean_architecture/features/home/di/home_injector.dart';
import 'package:flutter_clean_architecture/features/home/ui/home_bloc.dart';
import 'package:flutter_clean_architecture/features/home/ui/home_screen.dart';
import 'package:flutter_clean_architecture/res/app-strings.dart';
import 'package:flutter_clean_architecture/app/app_injector.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var config = AppConfig.of(context);

    AppInjector.initialise(config);

    return MaterialApp(
      title: config.appName,
      localizationsDelegates: [
        const StringsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('pt', ''),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<HomeBloc>(
          injector: HomeInjector.getInjector(),
          child: MyHomePage(title: config.appName)
      ),
    );
  }
}
