import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/elixirs_model.dart';

Future<List<Elixir>> fetchElixirs() async {
  final response = await http
      .get(Uri.parse('https://wizard-world-api.herokuapp.com/Elixirs'));
  if (response.statusCode == 200) {
    final parsedElixirs = json.decode(utf8.decode(response.bodyBytes));
    return parsedElixirs.map<Elixir>((json) => Elixir.fromJson(json)).toList();
  } else {
    throw Exception('Failed to fetch elixirs');
  }
}
