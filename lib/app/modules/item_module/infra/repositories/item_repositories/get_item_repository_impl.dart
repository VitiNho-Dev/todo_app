// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/item_entity.dart';
import '../../../domain/errors/failures.dart';
import '../../../domain/repositories/item_repositories/get_item_repository.dart';
import '../../datasources/item_datasources/get_item_datasource.dart';
import '../../mapper/item_mapper.dart';

class GetItemRepositoryImpl implements GetItemRepository {
  final GetItemDatasource _getItemDatasource;

  GetItemRepositoryImpl(this._getItemDatasource);

  @override
  Either<Failures, Stream<List<Item>>> getItems() {
    try {
      final result = _getItemDatasource.getItems();
      final listItems = result.map(
        (query) {
          return query.docs.map(
            (doc) {
              return ItemMapper.fromDocument(doc);
            },
          ).toList();
        },
      );
      return Right(listItems);
    } on Failures catch (e) {
      return Left(e);
    } catch (error, stack) {
      debugPrintStack(stackTrace: stack);
      throw Left(
        InvalidData(
          message: error.toString(),
          stackTrace: stack,
        ),
      );
    }
  }
}
