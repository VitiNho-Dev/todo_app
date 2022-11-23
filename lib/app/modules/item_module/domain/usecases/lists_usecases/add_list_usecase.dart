import 'package:dartz/dartz.dart';

import '../../entities/list_entity.dart';
import '../../errors/failures.dart';
import '../../repositories/lists_repositories/add_list_repository.dart';

abstract class AddListUsecase {
  Future<Either<Failures, Unit>> call(ListItems listItems);
}

class AddListUsecaseImpl implements AddListUsecase {
  final AddListRepository _addListRepository;

  const AddListUsecaseImpl(this._addListRepository);

  @override
  Future<Either<Failures, Unit>> call(ListItems listItems) async {
    if (listItems.name.isEmpty) {
      const InvalidData(message: 'Coloque um nome na sua lista');
    }
    return _addListRepository.addList(listItems);
  }
}
