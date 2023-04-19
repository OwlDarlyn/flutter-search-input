import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/spell_model.dart';

List<Spell> parseSpell(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Spell>((json) => Spell.fromJson(json)).toList();
}

Future<List<Spell>> fetchSpells() async {
  final response = await http
      .get(Uri.parse('https://wizard-world-api.herokuapp.com/Spells'));
  if (response.statusCode == 200) {
    // log(response.body);
    return parseSpell(utf8.decode(response.bodyBytes));
  } else {
    throw Exception('Failed to fetch spells');
  }
}
