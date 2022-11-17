// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/item_entity.dart';
import '../../../domain/errors/items_failures.dart';
import '../../../domain/repositories/item_repositories/get_item_repository.dart';
import '../../datasources/item_datasources/get_item_datasource.dart';

class GetItemRepositoryImpl implements GetItemRepository {
  final GetItemDatasource _getItemDatasource;

  GetItemRepositoryImpl(this._getItemDatasource);

  @override
  Either<Failures, Stream<List<Item>>> getItems() {
    try {
      var result = _getItemDatasource.getItems();
      return Right(result);
    } on Failures catch (e) {
      return Left(e);
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
      throw Left(InvalidError());
    }
  }
}
