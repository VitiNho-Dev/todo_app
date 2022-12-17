import 'package:dartz/dartz.dart';

import '../../../domain/entities/list_entity.dart';
import '../../../domain/errors/failures.dart';
import '../../../domain/repositories/lists_repositories/delete_list_repository.dart';
import '../../datasources/lists_datasources/delete_list_datasource.dart';

class DeleteListRepositoryImpl implements DeleteListRepository {
  final DeleteListDatasource _deleteListDatasource;

  DeleteListRepositoryImpl(this._deleteListDatasource);

  @override
  Future<Either<Failures, Unit>> deleteList(ListItems listItems) async {
    try {
      await _deleteListDatasource.deleteList(listItems);
      return const Right(unit);
    } on Failures catch (e) {
      return Left(e);
    }
  }
}
