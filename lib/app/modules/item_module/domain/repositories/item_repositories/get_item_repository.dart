import 'package:dartz/dartz.dart';

import '../../entities/item_entity.dart';
import '../../errors/failures.dart';

abstract class GetItemRepository {
  Either<Failures, Stream<List<Item>>> getItems(String idList);
}
