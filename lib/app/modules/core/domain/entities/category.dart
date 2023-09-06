class Category {
  final String id;
  final String name;

  Category({required this.id, required this.name});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
