// ignore_for_file: public_member_api_docs, sort_constructors_first
class Item {
  final String id;
  final String title;
  final bool check;
  final DateTime createAt;

  const Item({
    required this.id,
    required this.title,
    this.check = false,
    required this.createAt,
  });

  Item copyWith({
    String? id,
    String? title,
    bool? check,
    DateTime? createAt,
  }) {
    return Item(
      id: id ?? this.id,
      title: title ?? this.title,
      check: check ?? this.check,
      createAt: createAt ?? this.createAt,
    );
  }
}
