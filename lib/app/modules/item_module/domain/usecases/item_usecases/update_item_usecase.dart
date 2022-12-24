import 'package:dartz/dartz.dart';

import '../../entities/item_entity.dart';
import '../../errors/failures.dart';
import '../../repositories/item_repositories/update_item_repository.dart';

abstract class UpdateItemUsecase {
  Future<Either<Failures, Unit>> call(Item item, String idList);
}

class UpdateItemUsecaseImpl implements UpdateItemUsecase {
  final UpdateItemRepository _updateItemRepository;

  UpdateItemUsecaseImpl(this._updateItemRepository);

  @override
  Future<Either<Failures, Unit>> call(Item item, String idList) async {
    return await _updateItemRepository.updateItem(item, idList);
  }
}
