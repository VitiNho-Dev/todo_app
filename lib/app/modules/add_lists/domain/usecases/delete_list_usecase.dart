import 'package:app_todo/app/modules/add_items/domain/errors/items_failures.dart';
import 'package:app_todo/app/modules/add_lists/domain/entities/list_entity.dart';
import 'package:app_todo/app/modules/add_lists/domain/repositories/list_repository.dart';
import 'package:dartz/dartz.dart';

abstract class DeleteListUsecase {
  Future<Either<Failures, Unit>> call(ListEntity listEntity);
}

class DeleteListUsecaseImpl implements DeleteListUsecase {
  final ListRepository _repository;

  DeleteListUsecaseImpl(this._repository);
  
  @override
  Future<Either<Failures, Unit>> call(ListEntity listEntity) async {
    return await _repository.deleteList(listEntity);
  }
  
}
