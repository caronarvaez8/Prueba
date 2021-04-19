import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app/src/models/users.dart';

String url1 = "api.coingecko.com";
String url2 = "api/v3/coins/list";
Future<List<User>> getUser() async {
  List<User> result = [];
  var url = Uri.https(url1, url2);
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final item = jsonDecode(response.body);

      for (var i = 0; i < 11; i++) {
        User aux = User.fromJson(item[i]);
        result.add(aux);
      }
      return result;
    } else {
      return Future.error("Error de conexión");
    }
  } catch (e) {
    return Future.error(e);
  }
}
