class Inventor {
  final String id;
  final String firstName;
  final String lastName;

  const Inventor(
      {required this.id, required this.firstName, required this.lastName});

  factory Inventor.fromJson(Map<String, dynamic> json) {
    return Inventor(
        id: json['id'],
        firstName: json['firstName'] ?? "",
        lastName: json['lastName'] ?? "");
  }
}
