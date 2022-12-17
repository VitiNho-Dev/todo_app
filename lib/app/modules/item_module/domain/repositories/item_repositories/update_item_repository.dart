import 'package:dartz/dartz.dart';

import '../../entities/item_entity.dart';
import '../../errors/failures.dart';

abstract class UpdateItemRepository {
  Future<Either<Failures, Unit>> updateItem(Item item);
}
