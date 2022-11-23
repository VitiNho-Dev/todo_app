import 'package:dartz/dartz.dart';
import '../../../domain/entities/list_entity.dart';
import '../../../domain/errors/failures.dart';

abstract class AddListDatasource {
  Future<Either<Failures, Unit>> addLists(ListItems listItems);
}
