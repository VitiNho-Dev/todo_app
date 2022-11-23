// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

import '../../entities/list_entity.dart';
import '../../errors/failures.dart';

abstract class GetListsRepository {
  Either<Failures, Stream<List<ListItems>>> getLists();
}
