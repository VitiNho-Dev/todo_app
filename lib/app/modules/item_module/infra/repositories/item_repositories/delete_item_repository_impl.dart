// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';

import '../../../domain/entities/item_entity.dart';
import '../../../domain/errors/failures.dart';
import '../../../domain/repositories/item_repositories/delete_item_repository.dart';
import '../../datasources/item_datasources/delete_item_datasource.dart';

class DeleteItemRepositoryImpl implements DeleteItemRepository {
  final DeleteItemDatasource _deleteItemDatasource;

  DeleteItemRepositoryImpl(this._deleteItemDatasource);

  @override
  Future<Either<Failures, Unit>> deleteItem(Item item, String idList) async {
    try {
      await _deleteItemDatasource.deleteItem(item, idList);
      return const Right(unit);
    } on Failures catch (e) {
      return Left(e);
    }
  }
}
