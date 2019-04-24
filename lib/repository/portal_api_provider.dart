import 'package:http/http.dart' as http;
import 'package:transparencia/models/items.dart';
import 'dart:async';
import 'dart:convert';

class PortalApiProvider{
  final String _endpoint = "http://www.transparencia.gov.br/api-de-dados/cnep?pagina=1";

  Future<List<Item>> getUser() async {
    try {
      final response = await http.get(_endpoint, headers: {"Accept": "application/json"});
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
}