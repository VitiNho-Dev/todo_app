import 'package:dartz/dartz.dart';

import '../entities/item_entity.dart';
import '../errors/items_failures.dart';
import '../repositories/get_item_repository.dart';

abstract class GetItemUsecase {
  Either<Failures, Stream<List<Item>>> call();
}

class GetItemUsecaseImpl implements GetItemUsecase {
  final GetItemRepository _getItemRepository;

  GetItemUsecaseImpl(this._getItemRepository);

  @override
  Either<Failures, Stream<List<Item>>> call() {
    return _getItemRepository.getItems();
  }
}
