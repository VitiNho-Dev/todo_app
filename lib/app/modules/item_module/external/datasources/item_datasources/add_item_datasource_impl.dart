import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dartz/dartz.dart';

import '../../../domain/entities/item_entity.dart';
import '../../../infra/datasources/item_datasources/add_item_datasource.dart';
import '../../mapper/item_mapper.dart';

class AddItemDatasourceImpl implements AddItemDatasource {
  final FirebaseFirestore _firebaseFirestore;

  AddItemDatasourceImpl(this._firebaseFirestore);

  @override
  Future<Unit> addItem(Item item, String idList) async {
    await _firebaseFirestore
        .collection('Lists')
        .doc(idList)
        .collection('Items')
        .add(
          ItemMapper.toJson(item),
        );
    return unit;
  }
}
