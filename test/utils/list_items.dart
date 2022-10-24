import 'package:app_todo/app/modules/item_module/domain/entities/item_entity.dart';

Stream<List<Item>> listStream = [
  Item(
    title: 'Item-1',
    check: false,
    id: '',
    createAt: DateTime.now(),
  ),
] as Stream<List<Item>>;
