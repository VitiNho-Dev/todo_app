import 'package:app_todo/app/modules/item_module/domain/entities/item_entity.dart';
import 'package:app_todo/app/modules/item_module/domain/errors/failures.dart';
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
  const id = '';

  setUpAll(() async {
    addItemRepository = AddItemRepositoryMock();
    addItemUsecase = AddItemUsecaseImpl(addItemRepository);
    registerFallbackValue(item);
    registerFallbackValue(id);
  });

  group('Add Item Usecase test:', () {
    test('Should add an item in Firebase', () async {
      when(
        () => addItemRepository.addItem(any(), any()),
      ).thenAnswer((invocation) async => right(unit));

      final result = await addItemUsecase(item, id);

      expect(result.fold((l) => l, (r) => r), isA<Unit>());
    });

    test('Should return an error when add an item in Firebase', () async {
      when(
        () => addItemRepository.addItem(any(), any()),
      ).thenAnswer((invocation) async => left(const NoDataFound()));

      final result = await addItemUsecase(item, id);

      expect(result.fold((l) => l, (r) => r), isA<Failures>());
    });
  });
}
