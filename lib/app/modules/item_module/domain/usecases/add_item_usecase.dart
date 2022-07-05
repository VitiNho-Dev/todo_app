import 'package:dartz/dartz.dart';

import '../entities/item_entity.dart';
import '../errors/items_failures.dart';
import '../repositories/add_item_repository.dart';

abstract class AddItemUsecase {
  Future<Either<Failures, Unit>> call(ItemEntity itemEntity);
}

class AddItemUsecaseImpl implements AddItemUsecase {
  final AddItemRepository addItemRepository;

  AddItemUsecaseImpl(this.addItemRepository);

  @override
  Future<Either<Failures, Unit>> call(ItemEntity itemEntity) async {
    return await addItemRepository.addItem(itemEntity);
  }
}
