import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/elixirs_model.dart';

List<Elixir> parseElixir(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Elixir>((json) => Elixir.fromJson(json)).toList();
}

Future<List<Elixir>> fetchElixirs() async {
  final response = await http
      .get(Uri.parse('https://wizard-world-api.herokuapp.com/Elixirs'));
  if (response.statusCode == 200) {
    // log(response.body);
    return parseElixir(utf8.decode(response.bodyBytes));
  } else {
    throw Exception('Failed to fetch elixirs');
  }
}
