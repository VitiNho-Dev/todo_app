// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

import '../../entities/item_entity.dart';
import '../../errors/failures.dart';
import '../../repositories/item_repositories/get_item_repository.dart';

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
