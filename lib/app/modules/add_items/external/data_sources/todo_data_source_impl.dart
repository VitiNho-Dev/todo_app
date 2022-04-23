import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:app_todo/app/modules/add_items/domain/entities/item_entity.dart';
import 'package:app_todo/app/modules/add_items/external/mapper/todo_mapper.dart';
import 'package:app_todo/app/modules/add_items/infra/data_suorces/todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  FirebaseFirestore firebaseFirestore;

  TodoDataSourceImpl(this.firebaseFirestore);

  @override
  Stream<List<ItemEntity>> getItems() {
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

  @override
  Future<Unit> addItem(ItemEntity itemEntity) async {
    await firebaseFirestore.collection('Items').add(
          TodoMapper.toJson(itemEntity),
        );

    return unit;
  }

  @override
  Future<Unit> updateTodo(ItemEntity itemEntity) async {
    await firebaseFirestore.collection('Items').doc(itemEntity.id).update(
          TodoMapper.toJson(itemEntity),
        );
    return unit;
  }

  @override
  Future<Unit> deleteTodo(ItemEntity itemEntity) async {
    await firebaseFirestore.collection('Items').doc(itemEntity.id).delete();
    return unit;
  }
}
