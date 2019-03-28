import 'package:flutter_bloc_inject/flutter_bloc_inject.dart';
import 'package:flutter_clean_architecture/app/app_injector.dart';
import 'package:flutter_clean_architecture/features/home/repository/home_repository.dart';
import 'package:flutter_clean_architecture/features/home/ui/home_bloc.dart';


class HomeInjector {

  static const _NAME = "HomeInjector";

  static bool _initialized = false;

  static Injector getInjector(){

    if(!_initialized){
        _initialized = true;
      return initialise();
    }

    return Injector.getInjector(_NAME);
  }

  static dispose() {
    _initialized = false;
    getInjector().dispose();
  }

  static Injector initialise() {
    return getInjector()
      ..single((i) => HomeRepository(AppInjector.getInjector().get()))
      ..bloc((i) => HomeBloc(i.get()));
  }
}