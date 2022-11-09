import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/item_entity.dart';
import '../../../infra/datasources/item_datasources/get_item_datasource.dart';
import '../../mapper/item_mapper.dart';

class GetItemDatasourceImpl implements GetItemDatasource {
  final FirebaseFirestore _firebaseFirestore;

  GetItemDatasourceImpl(this._firebaseFirestore);

  @override
  Stream<List<Item>> getItems() {
    return _firebaseFirestore
        .collection('Lists')
        .doc('Xgzz71T9nAYkAVgmPQXc')
        .collection('Items')
        .orderBy('create_at', descending: false)
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return ItemMapper.fromDocument(doc);
      }).toList();
    });
  }
}
