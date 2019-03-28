import 'package:flutter_bloc_inject/flutter_bloc_inject.dart';
import 'package:flutter_clean_architecture/app/app_config.dart';
import 'package:flutter_clean_architecture/data/api/dio_client.dart';
import 'package:flutter_clean_architecture/data/api/rest_api.dart';


class AppInjector {

  static const _NAME = "BaseInjector";

  static Injector getInjector() => Injector.getInjector(_NAME);

  static dispose() {
    getInjector().dispose();
  }

  static Injector initialise(AppConfig config) {
    return getInjector()
      ..single((i) => config)
      ..single((i) => DioClient.getClient(i.get<AppConfig>().apiBaseUrl,  i.get<AppConfig>().apiKey))
      ..single((i) => RestApi(i.get()));
  }
}