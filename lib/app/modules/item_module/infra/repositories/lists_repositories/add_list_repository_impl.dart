import 'package:dartz/dartz.dart';

import '../../../domain/entities/list_entity.dart';
import '../../../domain/errors/failures.dart';
import '../../../domain/repositories/lists_repositories/add_list_repository.dart';
import '../../datasources/lists_datasources/add_list_datasource.dart';

class AddListRepositoryImpl implements AddListRepository {
  final AddListDatasource listDatasource;

  AddListRepositoryImpl(this.listDatasource);

  @override
  Future<Either<Failures, Unit>> addList(ListItems listItems) async {
    return listDatasource.addLists(listItems);
  }
}
