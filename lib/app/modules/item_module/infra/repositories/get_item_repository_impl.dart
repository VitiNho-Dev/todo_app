import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/item_entity.dart';
import '../../domain/errors/items_failures.dart';
import '../../domain/repositories/get_item_repository.dart';
import '../datasources/get_item_datasource.dart';

class GetItemRepositoryImpl implements GetItemRepository {
  final GetItemDatasource getItemDatasource;

  GetItemRepositoryImpl(this.getItemDatasource);

  @override
  Either<Failures, Stream<List<ItemEntity>>> getItems() {
    try {
      var result = getItemDatasource.getItems();
      return Right(result);
    } on Failures catch (e) {
      return Left(e);
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
      throw Left(InvalidError());
    }
  }
}
