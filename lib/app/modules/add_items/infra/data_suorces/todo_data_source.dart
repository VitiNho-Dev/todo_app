import 'package:app_todo/app/modules/add_items/domain/entities/item_entity.dart';
import 'package:dartz/dartz.dart';

abstract class TodoDataSource {
  // GET
  Stream<List<ItemEntity>> getItems();

  // ADD
  Future<Unit> addItem(ItemEntity itemEntity);

  // UPDATE
  Future<Unit> updateTodo(ItemEntity itemEntity);

  // REMOVE
  Future<Unit> deleteTodo(ItemEntity itemEntity);
}
