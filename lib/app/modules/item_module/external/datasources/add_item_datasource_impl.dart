import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/item_entity.dart';
import '../../infra/datasources/add_item_datasource.dart';
import '../mapper/todo_mapper.dart';

class AddItemDatasourceImpl implements AddItemDatasource {
  final FirebaseFirestore firebaseFirestore;

  AddItemDatasourceImpl(this.firebaseFirestore);

  @override
  Future<Unit> addItem(Item item) async {
    await firebaseFirestore.collection('Items').add(
          TodoMapper.toJson(item),
        );
    return unit;
  }
}
