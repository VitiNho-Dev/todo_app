import 'package:app_todo/app/modules/add_items/domain/errors/todo_failures.dart';
import 'package:app_todo/app/modules/add_lists/domain/entities/list_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ListRepository {
  // GET
  Either<Failures, Stream<List<ListEntity>>> getList();

  // ADD
  Future<Either<Failures, Unit>> addList(ListEntity listEntity);

  // UPDATE
  Future<Either<Failures, Unit>> updateList(ListEntity listEntity);

  // DELETE
  Future<Either<Failures, Unit>> deleteList(ListEntity listEntity);
}