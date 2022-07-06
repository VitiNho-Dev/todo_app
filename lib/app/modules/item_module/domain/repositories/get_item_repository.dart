import 'package:dartz/dartz.dart';

import '../entities/item_entity.dart';
import '../errors/items_failures.dart';

abstract class GetItemRepository {
  Either<Failures, Stream<List<Item>>> getItems();
}
