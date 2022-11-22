import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

import '../../../domain/entities/item_entity.dart';
import '../../../infra/datasources/item_datasources/update_item_datasource.dart';
import '../../../infra/mapper/item_mapper.dart';

class UpdateItemDatasourceImpl implements UpdateItemDatasource {
  final FirebaseFirestore _firebaseFirestore;

  UpdateItemDatasourceImpl(this._firebaseFirestore);

  @override
  Future<Unit> updateItem(Item item) async {
    await _firebaseFirestore
        .collection('Lists')
        .doc('Xgzz71T9nAYkAVgmPQXc')
        .collection('Items')
        .doc(item.id)
        .update(ItemMapper.toJson(item));
    return unit;
  }
}
