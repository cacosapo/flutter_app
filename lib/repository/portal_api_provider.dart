import 'package:http/http.dart' as http;
import 'package:transparencia/models/model.dart';
import 'dart:async';
import 'dart:convert';

class PortalApiProvider{
  final String _endpoint = "http://www.transparencia.gov.br/api-de-dados/cnep?pagina=1";
  final String _endpointCartoes = "http://www.transparencia.gov.br/api-de-dados/cartoes?mesExtratoInicio=01%2F2018&mesExtratoFim=01%2F2019&pagina=1";
  Map<String, String> _endpoint_headers = {"Accept": "application/json"};

  Future<List<Item>> getUser() async {
    try {
      final response = await http.get(_endpoint, headers: _endpoint_headers);
      final jsonResponse = json.decode(response.body);
      print('###############################');
      //print(json.decode(response.body)[0]['id']);
      print('###############################');
      //print(jsonResponse);
      //print(jsonResponse.map((value) => new Item.fromJson(value)).toList().runtimeType);
      print(ItemList.fromJson(jsonResponse).items.runtimeType);
      print('###############################2');
      //List<Item> data = new List<Item>();
      //data = jsonResponse.map((i)=>Item.fromJson(i)).toList();
      //print(data.length);
      //print(data.runtimeType);

      return ItemList.fromJson(jsonResponse).items;
      //return Item.fromJson(json.decode(response.body));
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List<Cartao>> getCartao() async {
    try {
      final response = await http.get(_endpointCartoes, headers: _endpoint_headers);
      final jsonResponse = json.decode(response.body);
      return CartaoList.fromJson(jsonResponse).items;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future getEndpoint(String endpoint) async {
    final response = await http.get(_endpoint, headers: _endpoint_headers);
    final jsonResponse = json.decode(response.body);
    return jsonResponse;
  }

}