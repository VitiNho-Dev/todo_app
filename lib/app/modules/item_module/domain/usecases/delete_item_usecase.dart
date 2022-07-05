import 'package:dartz/dartz.dart';

import '../entities/item_entity.dart';
import '../errors/items_failures.dart';
import '../repositories/delete_item_repository.dart';

abstract class DeleteItemUsecase {
  Future<Either<Failures, Unit>> call(ItemEntity itemEntity);
}

class DeleteItemUsecaseImpl implements DeleteItemUsecase {
  final DeleteItemRepository deleteItemRepository;

  DeleteItemUsecaseImpl(this.deleteItemRepository);

  @override
  Future<Either<Failures, Unit>> call(ItemEntity itemEntity) async {
    return await deleteItemRepository.deleteItem(itemEntity);
  }
}
