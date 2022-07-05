import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/item_entity.dart';
import '../../infra/datasources/update_item_datasource.dart';
import '../mapper/todo_mapper.dart';

class UpdateItemDatasourceImpl implements UpdateItemDatasource {
  final FirebaseFirestore firebaseFirestore;

  UpdateItemDatasourceImpl(this.firebaseFirestore);

  @override
  Future<Unit> updateItem(ItemEntity itemEntity) async {
    await firebaseFirestore.collection('Items').doc(itemEntity.id).update(
          TodoMapper.toJson(itemEntity),
        );
    return unit;
  }
}
