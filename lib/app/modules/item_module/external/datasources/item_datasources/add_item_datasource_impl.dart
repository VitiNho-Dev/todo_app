import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

import '../../../domain/entities/item_entity.dart';
import '../../../infra/datasources/item_datasources/add_item_datasource.dart';
import '../../mapper/item_mapper.dart';

class AddItemDatasourceImpl implements AddItemDatasource {
  final FirebaseFirestore _firebaseFirestore;

  AddItemDatasourceImpl(this._firebaseFirestore);

  @override
  Future<Unit> addItem(Item item) async {
    await _firebaseFirestore
        .collection('Lists')
        .doc('Xgzz71T9nAYkAVgmPQXc')
        .collection('Items')
        .add(
          ItemMapper.toJson(item),
        );
    return unit;
  }
}
