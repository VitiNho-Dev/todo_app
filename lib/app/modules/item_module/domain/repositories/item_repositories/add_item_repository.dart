import 'package:dartz/dartz.dart';

import '../../entities/item_entity.dart';
import '../../errors/failures.dart';

abstract class AddItemRepository {
  Future<Either<Failures, Unit>> addItem(Item item, String idList);
}
