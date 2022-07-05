import 'package:dartz/dartz.dart';

import '../../domain/entities/item_entity.dart';
import '../../domain/errors/items_failures.dart';
import '../../domain/repositories/add_item_repository.dart';
import '../datasources/add_item_datasource.dart';

class AddItemRepositoryImpl implements AddItemRepository {
  final AddItemDatasource addItemDatasource;

  AddItemRepositoryImpl(this.addItemDatasource);

  @override
  Future<Either<Failures, Unit>> addItem(ItemEntity itemEntity) async {
    try {
      await addItemDatasource.addItem(itemEntity);
      return const Right(unit);
    } on Failures catch (e) {
      return Left(e);
    }
  }
}
