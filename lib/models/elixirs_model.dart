import 'dart:developer';

import 'package:popsy_test_assignment/models/ingredient_model.dart';
import 'package:popsy_test_assignment/models/inventor_model.dart';

class Elixir {
  final String id;
  final String name;
  final String effect;
  final String sideEffects;
  final String difficulty;
  final List<Ingredient> ingredients;
  final List<Inventor> inventors;
  final String manufacturer;

  Elixir({
    required this.id,
    required this.name,
    required this.effect,
    required this.sideEffects,
    required this.difficulty,
    required this.ingredients,
    required this.inventors,
    required this.manufacturer,
  });
  factory Elixir.fromJson(Map<String, dynamic> json) {
    return Elixir(
      id: json['id'],
      name: json['name'] ?? 'Unknown',
      effect: json['effect'] ?? 'Unknown',
      sideEffects: json['sideEffects'] ?? 'Unknown',
      difficulty: json['difficulty'],
      ingredients: (json['ingredients'] as List)
          .map((ingredient) => Ingredient.fromJson(ingredient))
          .toList(),
      inventors: (json['inventors'] as List)
          .map((inventor) => Inventor.fromJson(inventor))
          .toList(),
      manufacturer: json['manufacturer'] ?? 'Unknown',
    );
  }
}
