import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/entities/list_entity.dart';
import '../../../domain/errors/failures.dart';
import '../../../domain/repositories/lists_repositories/get_lists_repository.dart';
import '../../../external/mapper/list_mapper.dart';
import '../../datasources/lists_datasources/get_lists_datasource.dart';

class GetListsRepositoryImpl implements GetListsRepository {
  final GetListsDatasource _datasource;

  GetListsRepositoryImpl(this._datasource);

  @override
  Either<Failures, Stream<List<ListItems>>> getLists() {
    try {
      final result = _datasource.getLists();
      final listsItems = result.map(
        (query) {
          return query.docs.map(
            (doc) {
              return ListsMapper.fromDocument(doc);
            },
          ).toList();
        },
      );
      return Right(listsItems);
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
