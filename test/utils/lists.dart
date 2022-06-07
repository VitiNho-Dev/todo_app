import 'package:app_todo/app/modules/add_lists/domain/entities/list_entity.dart';

Stream<List<ListEntity>> listsStream = [
  ListEntity(
    id: '',
    createAt: DateTime.now(),
    description: 'Lista de compra',
    name: 'Compras',
  ),
] as Stream<List<ListEntity>>;
