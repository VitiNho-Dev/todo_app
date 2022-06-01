import 'package:app_todo/app/modules/add_items/domain/errors/todo_failures.dart';
import 'package:app_todo/app/modules/add_items/domain/repositories/todos_repository.dart';
import 'package:app_todo/app/modules/add_lists/domain/entities/list_entity.dart';
import 'package:app_todo/app/modules/add_lists/domain/repositories/list_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetListUsecase {
  Either<Failures, Stream<List<ListEntity>>> call();
}

class GetListUsecaseImpl implements GetListUsecase {
  final ListRepository _repository;

  GetListUsecaseImpl(this._repository);

  @override
  Either<Failures, Stream<List<ListEntity>>> call() {
    return _repository.getList();
  }
  
}