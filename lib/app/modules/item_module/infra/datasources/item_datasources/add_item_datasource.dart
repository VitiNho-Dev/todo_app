import 'package:dartz/dartz.dart';

import '../../../domain/entities/item_entity.dart';

abstract class AddItemDatasource {
  Future<Unit> addItem(Item item);
}
