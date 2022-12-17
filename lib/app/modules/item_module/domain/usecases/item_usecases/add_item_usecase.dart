import 'package:dartz/dartz.dart';

import '../../entities/item_entity.dart';
import '../../errors/failures.dart';
import '../../repositories/item_repositories/add_item_repository.dart';

abstract class AddItemUsecase {
  Future<Either<Failures, Unit>> call(Item item, String idList);
}

class AddItemUsecaseImpl implements AddItemUsecase {
  final AddItemRepository _addItemRepository;

  AddItemUsecaseImpl(this._addItemRepository);

  @override
  Future<Either<Failures, Unit>> call(Item item, String idList) async {
    return await _addItemRepository.addItem(item, idList);
  }
}
