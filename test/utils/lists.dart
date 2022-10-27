import 'package:app_todo/app/modules/item_module/domain/entities/item_entity.dart';
import 'package:app_todo/app/modules/item_module/domain/entities/list_entity.dart';

Stream<List<ListItems>> lists = [
  ListItems(
    id: '',
    name: 'Lista 1',
    description: 'Lista de Compras',
    itens: <Item>[
      Item(
        id: '',
        title: 'Item 1',
        createAt: DateTime.now(),
      ),
    ],
    createAt: DateTime.now(),
  ),
] as Stream<List<ListItems>>;
