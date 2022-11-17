// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

import '../../entities/list_entity.dart';
import '../../errors/items_failures.dart';
import '../../repositories/lists_repositories/add_list_repository.dart';

abstract class AddListUsecase {
  Future<Either<Failures, Unit>> call(ListItems listItems);
}

class AddListUsecaseImpl implements AddListUsecase {
  final AddListRepository _addListRepository;

  AddListUsecaseImpl(this._addListRepository);

  @override
  Future<Either<Failures, Unit>> call(ListItems listItems) async {
    return await _addListRepository.addList(listItems);
  }
}
