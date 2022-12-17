import 'package:dartz/dartz.dart';

import '../../../domain/entities/list_entity.dart';

abstract class DeleteListDatasource {
  Future<Unit> deleteList(ListItems listItems);
}
