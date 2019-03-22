import 'package:flutter_bloc_inject/flutter_bloc_inject.dart';
import 'package:flutter_clean_architecture/repository/home_repository.dart';

class HomeBloc extends Bloc{

  final HomeRepository _repository;

  HomeBloc(this._repository);

  String getHomeName() => _repository.getHomeName();
}