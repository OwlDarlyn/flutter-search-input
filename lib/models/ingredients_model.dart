class Ingredients {
  final String id;
  final String name;

  Ingredients({
    required this.id,
    required this.name,
  });
  factory Ingredients.fromJson(Map<String, dynamic> json) {
    return Ingredients(
      id: json['id'],
      name: json['name'],
    );
  }
}
