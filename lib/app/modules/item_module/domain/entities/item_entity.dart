class ItemEntity {
  final String title;
  bool check;
  final String id;
  final DateTime createAt;

  ItemEntity({
    required this.title,
    required this.check,
    required this.id,
    required this.createAt,
  });

  ItemEntity copyWith({
    String? title,
    bool? check,
    String? id,
    DateTime? createAt,
  }) {
    return ItemEntity(
      title: title ?? this.title,
      check: check ?? this.check,
      id: id ?? this.id,
      createAt: createAt ?? this.createAt,
    );
  }
}
