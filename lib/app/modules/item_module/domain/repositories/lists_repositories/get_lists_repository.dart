import 'package:dartz/dartz.dart';

import '../../entities/list_entity.dart';
import '../../errors/items_failures.dart';

abstract class GetListsRepository {
  Either<Failures, Stream<List<ListItems>>> getLists();
}