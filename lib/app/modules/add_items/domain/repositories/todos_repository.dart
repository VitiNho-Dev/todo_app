import 'package:app_todo/app/modules/add_items/domain/entities/item_entity.dart';
import 'package:app_todo/app/modules/add_items/domain/errors/todo_failures.dart';
import 'package:dartz/dartz.dart';

abstract class TodoRepository {
  // GET
  Either<Failures, Stream<List<ItemEntity>>> getItem();

  // ADD
  Future<Either<Failures, Unit>> addItem(ItemEntity itemEntity);

  // UPDATE
  Future<Either<Failures, Unit>> updateItem(ItemEntity itemEntity);

  // REMOVE
  Future<Either<Failures, Unit>> removeItem(ItemEntity itemEntity);
}
