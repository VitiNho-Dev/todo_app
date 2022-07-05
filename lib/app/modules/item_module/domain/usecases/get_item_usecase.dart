import 'package:dartz/dartz.dart';

import '../entities/item_entity.dart';
import '../errors/items_failures.dart';
import '../repositories/get_item_repository.dart';

abstract class GetItemUsecase {
  Either<Failures, Stream<List<ItemEntity>>> call();
}

class GetItemUsecaseImpl implements GetItemUsecase {
  final GetItemRepository getItemRepository;

  GetItemUsecaseImpl(this.getItemRepository);

  @override
  Either<Failures, Stream<List<ItemEntity>>> call() {
    return getItemRepository.getItems();
  }
}
