class ListEntity {
  final String id;
  final DateTime createAt;
  final String description;
  final String name;

  ListEntity({
    required this.id,
    required this.createAt,
    required this.description,
    required this.name,
  });

  ListEntity copyWith({
    String? id,
    DateTime? createAt,
    String? description,
    String? name,
  }) {
    return ListEntity(
      id: id ?? this.id,
      createAt: createAt ?? this.createAt,
      description: description ?? this.description,
      name: name ?? this.name,
    );
  }
}
