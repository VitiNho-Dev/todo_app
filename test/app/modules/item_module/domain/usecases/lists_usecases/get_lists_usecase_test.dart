import 'package:app_todo/app/modules/item_module/domain/entities/list_entity.dart';
import 'package:app_todo/app/modules/item_module/domain/errors/items_failures.dart';
import 'package:app_todo/app/modules/item_module/domain/repositories/lists_repositories/get_lists_repository.dart';
import 'package:app_todo/app/modules/item_module/domain/usecases/lists_usecases/get_lists_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../utils/lists.dart';

class GetListsRepositoryMock extends Mock implements GetListsRepository {}

void main() {
  late GetListsRepository repository;
  late GetListsUsecase usecase;

  setUpAll(() {
    repository = GetListsRepositoryMock();
    usecase = GetListsUsecaseImpl(repository);
  });

  group('Get Lists usecase test:', () {
    test('Should return a List of Firebase Items', () async* {
      when(
        () => repository.getLists(),
      ).thenAnswer(
        (invocation) => right(lists),
      );

      final result = usecase();

      expect(result.fold((l) => l, (r) => r), isA<List<ListItems>>());
    });

    test('Should return an error when bringing a list of items from Firebase',
        () {
      when(
        () => repository.getLists(),
      ).thenAnswer(
        (invocation) => left(NoDataFound()),
      );

      final result = usecase();

      expect(result.fold((l) => l, (r) => r), isA<Failures>());
    });
  });
}
