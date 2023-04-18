import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/elixirs_model.dart';

List<Elixirs> parseElixirs(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Elixirs>((json) => Elixirs.fromJson(json)).toList();
}

Future<List<Elixirs>> fetchElixirs() async {
  final response = await http
      .get(Uri.parse('https://wizard-world-api.herokuapp.com/Elixirs'));
  if (response.statusCode == 200) {
    // log(response.body);
    return parseElixirs(utf8.decode(response.bodyBytes));
  } else {
    throw Exception('Failed to fetch elixirs');
  }
}
