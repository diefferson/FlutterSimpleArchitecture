
import 'package:flutter_bloc_inject/flutter_bloc_inject.dart';
import 'package:flutter_clean_architecture/api/rest_api.dart';
import 'package:flutter_clean_architecture/repository/home_repository.dart';
import 'package:flutter_clean_architecture/ui/home/home_bloc.dart';

class AppInjector {


  Injector initialise(Injector injector) {
    return injector
    ..single<RestApi>((i) => RestApi("base url"))
    ..single<HomeRepository>((i) => HomeRepository(i.get()))
    ..bloc<HomeBloc>((i) => HomeBloc(i.get()));

  }

}