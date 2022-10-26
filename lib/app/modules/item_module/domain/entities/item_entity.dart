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
}
