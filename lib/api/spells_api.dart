import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/spells_model.dart';

List<Spells> parseSpells(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Spells>((json) => Spells.fromJson(json)).toList();
}

Future<List<Spells>> fetchSpells() async {
  final response = await http
      .get(Uri.parse('https://wizard-world-api.herokuapp.com/Spells'));
  if (response.statusCode == 200) {
    // log(response.body);
    return parseSpells(utf8.decode(response.bodyBytes));
  } else {
    throw Exception('Failed to fetch spells');
  }
}
