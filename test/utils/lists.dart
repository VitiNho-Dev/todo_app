import 'package:app_todo/app/modules/item_module/domain/entities/list_entity.dart';

Stream<List<ListItems>> lists = [
  ListItems(
    id: '',
    name: 'Lista 1',
    description: 'Lista de Compras',
    createAt: DateTime.now(),
  ),
] as Stream<List<ListItems>>;
