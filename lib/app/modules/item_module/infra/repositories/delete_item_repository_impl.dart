import 'package:dartz/dartz.dart';

import '../../domain/entities/item_entity.dart';
import '../../domain/errors/items_failures.dart';
import '../../domain/repositories/delete_item_repository.dart';
import '../datasources/delete_item_datasource.dart';

class DeleteItemRepositoryImpl implements DeleteItemRepository {
  final DeleteItemDatasource deleteItemDatasource;

  DeleteItemRepositoryImpl(this.deleteItemDatasource);

  @override
  Future<Either<Failures, Unit>> deleteItem(ItemEntity itemEntity) async {
    try {
      await deleteItemDatasource.deleteItem(itemEntity);
      return const Right(unit);
    } on Failures catch (e) {
      return Left(e);
    }
  }
}
