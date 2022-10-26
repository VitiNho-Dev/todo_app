import 'item_entity.dart';

class ListItems {
  final String id;
  final String name;
  final String description;
  final List<Item> itens;
  final DateTime createAt;

  const ListItems({
    required this.id,
    required this.name,
    required this.description,
    required this.itens,
    required this.createAt,
  });
}
