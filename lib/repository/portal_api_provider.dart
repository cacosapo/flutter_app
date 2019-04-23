import 'package:http/http.dart' as http;
import 'package:transparencia/models/items.dart';
import 'dart:async';
import 'dart:convert';

class PortalApiProvider{
  final String _endpoint = "http://www.transparencia.gov.br/api-de-dados/cnep?pagina=1";

  Future getUser() async {
    try {
      final response = await http.get(_endpoint, headers: {"Accept": "application/json"});
      print('###############################');
      print(json.decode(response.body)[0]['abrangenciaDefinidaDecisaoJudicial']);
      print('###############################');
      return json.decode(response.body);
      //return Item.fromJson(json.decode(response.body));
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}