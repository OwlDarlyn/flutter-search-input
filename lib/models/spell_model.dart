class Spell {
  final String id;
  final String name;
  final String incantation;
  final String effect;
  final bool canBeVerbal;
  final String type;
  final String light;
  final String creator;

  Spell({
    required this.id,
    required this.name,
    required this.incantation,
    required this.effect,
    required this.canBeVerbal,
    required this.type,
    required this.light,
    required this.creator,
  });
  factory Spell.fromJson(Map<String, dynamic> json) {
    return Spell(
      id: json['id'],
      name: json['name'],
      incantation: json['incantation'] ?? '',
      effect: json['effect'],
      canBeVerbal: json['canBeVerbal'] ?? false,
      type: json['type'],
      light: json['light'],
      creator: json['creator'] ?? '',
    );
  }
}
