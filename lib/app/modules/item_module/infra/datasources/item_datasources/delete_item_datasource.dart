import 'package:dartz/dartz.dart';

import '../../../domain/entities/item_entity.dart';

abstract class DeleteItemDatasource {
  Future<Unit> deleteItem(Item item, String idList);
}
