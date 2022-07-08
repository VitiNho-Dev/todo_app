import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/item_entity.dart';
import '../../infra/datasources/delete_item_datasource.dart';

class DeleteItemDatasourceImpl implements DeleteItemDatasource {
  final FirebaseFirestore firebaseFirestore;

  DeleteItemDatasourceImpl(this.firebaseFirestore);

  @override
  Future<Unit> deleteItem(Item item) async {
    await firebaseFirestore.collection('Items').doc(item.id).delete();
    return unit;
  }
}
