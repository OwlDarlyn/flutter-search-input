import 'package:popsy_test_assignment/models/elixirs_model.dart';

class Wizard {
  final List<dynamic> elixirs;
  final String id;
  final String firstName;
  final String lastName;

  Wizard({
    required this.elixirs,
    required this.id,
    required this.firstName,
    required this.lastName,
  });
  factory Wizard.fromJson(Map<String, dynamic> json) {
    return Wizard(
      elixirs: json['elixirs'] ?? [],
      id: json['id'],
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
    );
  }
}
