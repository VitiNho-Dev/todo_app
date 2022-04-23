import 'package:app_todo/app/modules/add_items/domain/entities/item_entity.dart';
import 'package:app_todo/app/modules/add_items/domain/errors/todo_failures.dart';
import 'package:app_todo/app/modules/add_items/domain/repositories/todos_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetTodo {
  Either<Failures, Stream<List<ItemEntity>>> call();
}

class GetTodoImpl implements GetTodo {
  final TodoRepository repository;

  GetTodoImpl(this.repository);

  @override
  Either<Failures, Stream<List<ItemEntity>>> call() {
    return repository.getItem();
  }
}
