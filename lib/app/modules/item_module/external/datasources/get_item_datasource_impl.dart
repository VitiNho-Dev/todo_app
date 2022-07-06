import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/item_entity.dart';
import '../../infra/datasources/get_item_datasource.dart';
import '../mapper/todo_mapper.dart';

class GetItemDatasourceImpl implements GetItemDatasource {
  final FirebaseFirestore firebaseFirestore;

  GetItemDatasourceImpl(this.firebaseFirestore);

  @override
  Stream<List<Item>> getItems() {
    return firebaseFirestore
        .collection('Items')
        .orderBy('create_at', descending: false)
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return TodoMapper.fromDocument(doc);
      }).toList();
    });
  }
}
