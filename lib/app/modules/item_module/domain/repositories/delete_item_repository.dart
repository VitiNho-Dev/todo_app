import 'package:dartz/dartz.dart';

import '../entities/item_entity.dart';
import '../errors/items_failures.dart';

abstract class DeleteItemRepository {
  Future<Either<Failures, Unit>> deleteItem(ItemEntity itemEntity);
}
