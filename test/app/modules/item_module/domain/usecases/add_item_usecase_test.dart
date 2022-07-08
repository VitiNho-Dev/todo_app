import 'package:app_todo/app/modules/item_module/domain/entities/item_entity.dart';
import 'package:app_todo/app/modules/item_module/domain/errors/items_failures.dart';
import 'package:app_todo/app/modules/item_module/domain/repositories/add_item_repository.dart';
import 'package:app_todo/app/modules/item_module/domain/usecases/add_item_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AddItemRepositoryMock extends Mock implements AddItemRepository {}

void main() {
  late AddItemRepository addItemRepository;
  late AddItemUsecase addItemUsecase;
  final _item = Item(
    title: 'Item teste',
    check: false,
    id: '123',
    createAt: DateTime.now(),
  );

  setUpAll(() async {
    addItemRepository = AddItemRepositoryMock();
    addItemUsecase = AddItemUsecaseImpl(addItemRepository);
    registerFallbackValue(_item);
  });

  group('Add Item Usecase test', () {
    test('Deve adicionar um item no Firebase', () async {
      when(
        () => addItemRepository.addItem(any()),
      ).thenAnswer((invocation) async => right(unit));

      final _result = await addItemUsecase(_item);

      expect(_result.fold((l) => l, (r) => r), isA<Unit>());
    });

    test('Deve retornar um erro ao adicionar um item no Firebase', () async {
      when(
        () => addItemRepository.addItem(any()),
      ).thenAnswer((invocation) async => left(NoDataFound()));

      final _result = await addItemUsecase(_item);

      expect(_result.fold((l) => l, (r) => r), isA<Failures>());
    });
  });
}
