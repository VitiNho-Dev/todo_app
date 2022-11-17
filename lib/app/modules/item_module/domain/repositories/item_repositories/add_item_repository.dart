// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

import '../../entities/item_entity.dart';
import '../../errors/items_failures.dart';

abstract class AddItemRepository {
  Future<Either<Failures, Unit>> addItem(Item item);
}
