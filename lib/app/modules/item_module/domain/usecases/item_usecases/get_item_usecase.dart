import 'package:dartz/dartz.dart';

import '../../entities/item_entity.dart';
import '../../errors/failures.dart';
import '../../repositories/item_repositories/get_item_repository.dart';

abstract class GetItemUsecase {
  Either<Failures, Stream<List<Item>>> call(String idList);
}

class GetItemUsecaseImpl implements GetItemUsecase {
  final GetItemRepository _getItemRepository;

  GetItemUsecaseImpl(this._getItemRepository);

  @override
  Either<Failures, Stream<List<Item>>> call(String idList) {
    return _getItemRepository.getItems(idList);
  }
}
