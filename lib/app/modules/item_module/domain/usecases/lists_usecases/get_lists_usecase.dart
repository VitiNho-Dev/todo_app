// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import '../../entities/list_entity.dart';
import '../../errors/failures.dart';
import '../../repositories/lists_repositories/get_lists_repository.dart';

abstract class GetListsUsecase {
  Either<Failures, Stream<List<ListItems>>> call();
}

class GetListsUsecaseImpl implements GetListsUsecase {
  final GetListsRepository _repository;

  GetListsUsecaseImpl(this._repository);

  @override
  Either<Failures, Stream<List<ListItems>>> call() {
    return _repository.getLists();
  }
}
