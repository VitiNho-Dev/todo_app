import 'package:app_todo/app/modules/item_module/domain/entities/item_entity.dart';
import 'package:app_todo/app/modules/item_module/domain/errors/items_failures.dart';
import 'package:app_todo/app/modules/item_module/domain/repositories/item_repositories/add_item_repository.dart';
import 'package:app_todo/app/modules/item_module/domain/usecases/item_usecases/add_item_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AddItemRepositoryMock extends Mock implements AddItemRepository {}

void main() {
  late AddItemRepository addItemRepository;
  late AddItemUsecase addItemUsecase;
  final item = Item(
    id: '123',
    title: 'Item teste',
    createAt: DateTime.now(),
  );

  setUpAll(() async {
    addItemRepository = AddItemRepositoryMock();
    addItemUsecase = AddItemUsecaseImpl(addItemRepository);
    registerFallbackValue(item);
  });

  group('Add Item Usecase test:', () {
    test('Should add an item in Firebase', () async {
      when(
        () => addItemRepository.addItem(any()),
      ).thenAnswer((invocation) async => right(unit));

      final _result = await addItemUsecase(item);

      expect(_result.fold((l) => l, (r) => r), isA<Unit>());
    });

    test('Should return an error when add an item in Firebase', () async {
      when(
        () => addItemRepository.addItem(any()),
      ).thenAnswer((invocation) async => left(NoDataFound()));

      final _result = await addItemUsecase(item);

      expect(_result.fold((l) => l, (r) => r), isA<Failures>());
    });
  });
}
