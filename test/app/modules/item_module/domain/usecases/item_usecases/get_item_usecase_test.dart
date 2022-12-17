import 'package:app_todo/app/modules/item_module/domain/entities/item_entity.dart';
import 'package:app_todo/app/modules/item_module/domain/errors/failures.dart';
import 'package:app_todo/app/modules/item_module/domain/repositories/item_repositories/get_item_repository.dart';
import 'package:app_todo/app/modules/item_module/domain/usecases/item_usecases/get_item_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../utils/items.dart';

class GetItemRepositoryMock extends Mock implements GetItemRepository {}

void main() {
  late GetItemRepository getItemRepository;
  late GetItemUsecase getItemUsecase;
  const idList = '';

  setUpAll(() async {
    getItemRepository = GetItemRepositoryMock();
    getItemUsecase = GetItemUsecaseImpl(getItemRepository);
    registerFallbackValue(idList);
  });

  group('Get Item Usecase test:', () {
    test('Should return an item of Firebase', () async* {
      when(
        () => getItemRepository.getItems(idList),
      ).thenAnswer((invocation) => right(items));

      final result = getItemUsecase(idList);

      expect(result.fold((l) => l, (r) => r), isA<List<Item>>());
    });

    test('Should return an error when get item of Firebase', () async* {
      when(
        () => getItemRepository.getItems(idList),
      ).thenAnswer((invocation) => left(const NoDataFound()));

      final result = getItemUsecase(idList);

      expect(result.fold((l) => l, (r) => r), isA<Failures>());
    });
  });
}
