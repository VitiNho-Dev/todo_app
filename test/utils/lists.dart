import 'package:app_todo/app/modules/item_module/domain/entities/list_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Stream<List<ListItems>> lists = [
  ListItems(
    id: '',
    name: 'Lista 1',
    description: 'Lista de Compras',
    createAt: DateTime.now(),
  ),
] as Stream<List<ListItems>>;

Stream<QuerySnapshot<Map<String, dynamic>>> listSnapshot = [
  {
    'id': '',
    'name': 'Lista 1',
    'description': 'List de Compras',
    'creatAt': '21/11/2022',
  },
] as Stream<QuerySnapshot<Map<String, dynamic>>>;
