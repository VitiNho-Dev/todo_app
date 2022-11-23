// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

import '../../entities/item_entity.dart';
import '../../errors/failures.dart';

abstract class DeleteItemRepository {
  Future<Either<Failures, Unit>> deleteItem(Item item);
}
