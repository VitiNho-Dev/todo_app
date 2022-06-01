import 'package:app_todo/app/modules/add_items/domain/entities/item_entity.dart';

class ListEntity {
  final String id;
  final List<ItemEntity> items;

  ListEntity({
    required this.id,
    required this.items,
  });

  ListEntity copyWith({
    String? id,
    List<ItemEntity>? items,
  }) {
    return ListEntity(
      id: id ?? this.id,
      items: items ?? this.items,
    );
  }
}
