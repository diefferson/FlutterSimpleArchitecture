
import 'package:flutter_clean_architecture/api/rest_api.dart';

class HomeRepository{

  final RestApi _restApi;

  HomeRepository(this._restApi);


  String getHomeName() => _restApi.getHomeName();


}