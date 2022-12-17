import 'package:dartz/dartz.dart';

import '../../entities/list_entity.dart';
import '../../errors/failures.dart';
import '../../repositories/lists_repositories/delete_list_repository.dart';

abstract class DeleteListUsecase {
  Future<Either<Failures, Unit>> call(ListItems listItems);
}

class DeleteListUsecaseImpl implements DeleteListUsecase {
  final DeleteListRepository _deleteListRepository;

  DeleteListUsecaseImpl(this._deleteListRepository);

  @override
  Future<Either<Failures, Unit>> call(ListItems listItems) async {
    return await _deleteListRepository.deleteList(listItems);
  }
}
