import 'package:app_todo/app/modules/item_module/domain/entities/item_entity.dart';
import 'package:app_todo/app/modules/item_module/domain/errors/items_failures.dart';
import 'package:app_todo/app/modules/item_module/domain/repositories/get_item_repository.dart';
import 'package:app_todo/app/modules/item_module/domain/usecases/get_item_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/list_items.dart';

class GetItemRepositoryMock extends Mock implements GetItemRepository {}

void main() {
  late GetItemRepository getItemRepository;
  late GetItemUsecase getItemUsecase;

  setUpAll(() async {
    getItemRepository = GetItemRepositoryMock();
    getItemUsecase = GetItemUsecaseImpl(getItemRepository);
  });

  group('Get Item Usecase test', () {
    test('Deve trazer uma lista de items do Firebase', () async* {
      when(
        () => getItemRepository.getItems(),
      ).thenAnswer((invocation) => right(listStream));

      final _result = getItemUsecase();

      expect(_result.fold((l) => l, (r) => r), isA<List<Item>>());
    });

    test('Deve retornar um erro ao trazer os items do Firebase', () async* {
      when(
        () => getItemRepository.getItems(),
      ).thenAnswer((invocation) => left(NoDataFound()));

      final _result = getItemUsecase();

      expect(_result.fold((l) => l, (r) => r), isA<Failures>());
    });
  });
}
