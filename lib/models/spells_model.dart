class Spells {
  final String id;
  final String name;
  final String incantation;
  final String effect;
  final String canBeVerbal;
  final String type;
  final String light;
  final String creator;

  Spells({
    required this.id,
    required this.name,
    required this.incantation,
    required this.effect,
    required this.canBeVerbal,
    required this.type,
    required this.light,
    required this.creator,
  });
  factory Spells.fromJson(Map<String, dynamic> json) {
    return Spells(
      id: json['id'],
      name: json['name'],
      incantation: json['incantation'],
      effect: json['effect'],
      canBeVerbal: json['canBeVerbal'],
      type: json['type'],
      light: json['light'],
      creator: json['creator'],
    );
  }
}
