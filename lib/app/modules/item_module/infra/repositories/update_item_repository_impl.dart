import 'package:dartz/dartz.dart';

import '../../domain/entities/item_entity.dart';
import '../../domain/errors/items_failures.dart';
import '../../domain/repositories/update_item_repository.dart';
import '../datasources/update_item_datasource.dart';

class UpdateItemRepositoryImpl implements UpdateItemRepository {
  final UpdateItemDatasource _updateItemDatasource;

  UpdateItemRepositoryImpl(this._updateItemDatasource);

  @override
  Future<Either<Failures, Unit>> updateItem(Item item) async {
    try {
      await _updateItemDatasource.updateItem(item);
      return const Right(unit);
    } on Failures catch (e) {
      return Left(e);
    }
  }
}
