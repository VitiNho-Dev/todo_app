import 'package:dartz/dartz.dart';

import '../entities/item_entity.dart';
import '../errors/items_failures.dart';
import '../repositories/update_item_repository.dart';

abstract class UpdateItemUsecase {
  Future<Either<Failures, Unit>> call(ItemEntity itemEntity);
}

class UpdateItemUsecaseImpl implements UpdateItemUsecase {
  final UpdateItemRepository updateItemRepository;

  UpdateItemUsecaseImpl(this.updateItemRepository);

  @override
  Future<Either<Failures, Unit>> call(ItemEntity itemEntity) async {
    return await updateItemRepository.updateItem(itemEntity);
  }
}
