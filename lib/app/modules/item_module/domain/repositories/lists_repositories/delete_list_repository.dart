import 'package:dartz/dartz.dart';

import '../../entities/list_entity.dart';
import '../../errors/failures.dart';

abstract class DeleteListRepository {
  Future<Either<Failures, Unit>> deleteList(ListItems listItems);
}
