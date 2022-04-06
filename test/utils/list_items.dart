import 'package:app_todo/app/modules/add_items/domain/entities/item_entity.dart';

Stream<List<ItemEntity>> listStream = [
  ItemEntity(
    title: 'Item-1',
    check: false,
    id: '',
    createAt: DateTime.now(),
  ),
] as Stream<List<ItemEntity>>;
