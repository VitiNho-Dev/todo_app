import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/entities/list_entity.dart';
import '../../../domain/errors/items_failures.dart';
import '../../../domain/repositories/lists_repositories/get_lists_repository.dart';
import '../../datasources/lists_datasources/get_lists_datasource.dart';

class GetListsRepositoryImpl implements GetListsRepository {
  final GetListsDatasource _datasource;

  GetListsRepositoryImpl(this._datasource);

  @override
  Either<Failures, Stream<List<ListItems>>> getLists() {
    try {
      var result = _datasource.getLists();
      return Right(result);
    } on Failures catch (e) {
      return Left(e);
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
      throw Left(InvalidError());
    }
  }
}
