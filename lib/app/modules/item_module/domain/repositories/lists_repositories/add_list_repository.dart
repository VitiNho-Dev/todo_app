import 'package:dartz/dartz.dart';
import '../../entities/list_entity.dart';
import '../../errors/failures.dart';

abstract class AddListRepository {
  Future<Either<Failures, Unit>> addList(ListItems listItems);
}
