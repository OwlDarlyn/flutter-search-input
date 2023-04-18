class Elixirs {
  final String id;
  final String name;
  final String effect;
  final String sideEffects;
  final String difficulty;
  final String ingredients;
  final String inventors;
  final String manufacturer;

  Elixirs({
    required this.id,
    required this.name,
    required this.effect,
    required this.sideEffects,
    required this.difficulty,
    required this.ingredients,
    required this.inventors,
    required this.manufacturer,
  });
  factory Elixirs.fromJson(Map<String, dynamic> json) {
    return Elixirs(
      id: json['id'],
      name: json['name'],
      effect: json['effect'],
      sideEffects: json['sideEffects'],
      difficulty: json['difficulty'],
      ingredients: json['ingredients']['id'],
      inventors: json['inventors'],
      manufacturer: json['manufacturer']['id'],
    );
  }
}
