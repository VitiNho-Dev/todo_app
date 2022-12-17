import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dartz/dartz.dart';

import '../../../domain/entities/item_entity.dart';
import '../../../infra/datasources/item_datasources/delete_item_datasource.dart';

class DeleteItemDatasourceImpl implements DeleteItemDatasource {
  final FirebaseFirestore _firebaseFirestore;

  DeleteItemDatasourceImpl(this._firebaseFirestore);

  @override
  Future<Unit> deleteItem(Item item, String idList) async {
    await _firebaseFirestore
        .collection('Lists')
        .doc(idList)
        .collection('Items')
        .doc(item.id)
        .delete();
    return unit;
  }
}
