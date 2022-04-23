import 'package:app_todo/app/modules/add_items/domain/entities/item_entity.dart';
import 'package:app_todo/app/modules/add_items/domain/errors/todo_failures.dart';
import 'package:app_todo/app/modules/add_items/domain/repositories/todos_repository.dart';
import 'package:dartz/dartz.dart';

abstract class DeleteTodo {
  Future<Either<Failures, Unit>> call(ItemEntity itemEntity);
}

class DeleteTodoImpl implements DeleteTodo {
  final TodoRepository repository;

  DeleteTodoImpl(this.repository);

  @override
  Future<Either<Failures, Unit>> call(ItemEntity itemEntity) async {
    return await repository.removeItem(itemEntity);
  }
}
