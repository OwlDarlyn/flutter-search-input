class Elixir {
  final String id;
  final String name;
  final String effect;
  final String sideEffects;
  final String difficulty;
  final List ingredients;
  final List inventors;
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
      name: json['name'] ?? "",
      effect: json['effect'] ?? "",
      sideEffects: json['sideEffects'] ?? "",
      difficulty: json['difficulty'],
      ingredients: json['ingredients'],
      inventors: json['inventors'],
      manufacturer: json['manufacturer'] ?? '',
    );
  }
}
