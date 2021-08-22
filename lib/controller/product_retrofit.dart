import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductRepostiory {
  var url = "https://fakestoreapi.com/products";

  loadProductIsFromAPI() async {
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }
}
