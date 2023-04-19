import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/ingredient_model.dart';

List<Ingredient> parseIngredients(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Ingredient>((json) => Ingredient.fromJson(json)).toList();
}

Future<List<Ingredient>> fetchIngredients() async {
  final response = await http
      .get(Uri.parse('https://wizard-world-api.herokuapp.com/Ingredients'));
  if (response.statusCode == 200) {
    // log(response.body);
    return parseIngredients(utf8.decode(response.bodyBytes));
  } else {
    throw Exception('Failed to fetch ingredients');
  }
}
