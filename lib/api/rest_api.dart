
import 'dart:io';
import 'package:http/http.dart';

class RestApi{

  static const _BASE_URL = "https://meucartaotransporte.com.br/api/";

  Future<Response> getCardBalance(String code, String cpf){
    return post(_BASE_URL+"v2/cartao",
        body: {"c": code,"d":cpf, "t": "saldo"},
        headers: {HttpHeaders.authorizationHeader: "aHR0cHM6Ly9tZXVjYXJ0YW90cmFuc3BvcnRlLmNvbS5ici9hcGkvY2FydGFv"});
  }


  Future<Response> getExtract(String code, String cpf){
    return post(_BASE_URL+"v2/cartao",
        body: {"c": code,"d":cpf, "t": "extrato"},
        headers: {HttpHeaders.authorizationHeader: "aHR0cHM6Ly9tZXVjYXJ0YW90cmFuc3BvcnRlLmNvbS5ici9hcGkvY2FydGFv"});
  }

}