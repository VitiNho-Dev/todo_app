// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

import '../../entities/item_entity.dart';
import '../../errors/failures.dart';
import '../../repositories/item_repositories/delete_item_repository.dart';

abstract class DeleteItemUsecase {
  Future<Either<Failures, Unit>> call(Item item);
}

class DeleteItemUsecaseImpl implements DeleteItemUsecase {
  final DeleteItemRepository _deleteItemRepository;

  DeleteItemUsecaseImpl(this._deleteItemRepository);

  @override
  Future<Either<Failures, Unit>> call(Item item) async {
    return await _deleteItemRepository.deleteItem(item);
  }
}
