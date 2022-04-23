import 'package:app_todo/app/modules/add_items/domain/entities/item_entity.dart';
import 'package:app_todo/app/modules/add_items/domain/errors/todo_failures.dart';
import 'package:app_todo/app/modules/add_items/domain/repositories/todos_repository.dart';
import 'package:dartz/dartz.dart';

abstract class IAddTodoUsecase {
  Future<Either<Failures, Unit>> call(ItemEntity itemEntity);
}

class AddTodoUsecase implements IAddTodoUsecase {
  final TodoRepository repository;

  AddTodoUsecase(this.repository);

  @override
  Future<Either<Failures, Unit>> call(ItemEntity itemEntity) {
    return repository.addItem(itemEntity);
  }
}
