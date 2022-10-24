import 'package:app_todo/app/modules/item_module/domain/entities/item_entity.dart';
import 'package:app_todo/app/modules/item_module/domain/errors/items_failures.dart';
import 'package:app_todo/app/modules/item_module/domain/repositories/update_item_repository.dart';
import 'package:app_todo/app/modules/item_module/domain/usecases/update_item_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class UpdateItemRepositoryMock extends Mock implements UpdateItemRepository {}

void main() {
  late UpdateItemRepository updateItemRepository;
  late UpdateItemUsecase updateItemUsecase;
  final _item = Item(
    title: 'Item teste',
    check: false,
    id: '123',
    createAt: DateTime.now(),
  );

  setUpAll(() async {
    updateItemRepository = UpdateItemRepositoryMock();
    updateItemUsecase = UpdateItemUsecaseImpl(updateItemRepository);
    registerFallbackValue(_item);
  });

  group('Update Item Usecase test', () {
    test('Deve atualizar um item no Firebase', () async {
      when(
        () => updateItemRepository.updateItem(any()),
      ).thenAnswer((invocation) async => right(unit));

      final _result = await updateItemUsecase(_item);

      expect(_result.fold((l) => l, (r) => r), isA<Unit>());
    });

    test('Deve retornar um erro ao tentar atualizar um item no Firebase',
        () async {
      when(
        () => updateItemRepository.updateItem(any()),
      ).thenAnswer((invocation) async => left(NoDataFound()));

      final _result = await updateItemUsecase(_item);

      expect(_result.fold((l) => l, (r) => r), isA<Failures>());
    });
  });
}
