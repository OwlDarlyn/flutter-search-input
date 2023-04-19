import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/wizard_model.dart';

List<Wizard> parseWizard(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Wizard>((json) => Wizard.fromJson(json)).toList();
}

Future<List<Wizard>> fetchWizards() async {
  final response = await http
      .get(Uri.parse('https://wizard-world-api.herokuapp.com/Wizards'));
  if (response.statusCode == 200) {
    // log(response.body);
    return parseWizard(utf8.decode(response.bodyBytes));
  } else {
    throw Exception('Failed to fetch wizards');
  }
}
