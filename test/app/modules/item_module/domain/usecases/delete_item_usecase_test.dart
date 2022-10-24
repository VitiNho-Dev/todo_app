import 'package:app_todo/app/modules/item_module/domain/entities/item_entity.dart';
import 'package:app_todo/app/modules/item_module/domain/errors/items_failures.dart';
import 'package:app_todo/app/modules/item_module/domain/repositories/delete_item_repository.dart';
import 'package:app_todo/app/modules/item_module/domain/usecases/delete_item_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DeleteItemRepositoryMock extends Mock implements DeleteItemRepository {}

void main() {
  late DeleteItemRepository deleteItemRepository;
  late DeleteItemUsecase deleteItemUsecase;
  final _item = Item(
    title: 'Item teste',
    check: false,
    id: '123',
    createAt: DateTime.now(),
  );

  setUpAll(() async {
    deleteItemRepository = DeleteItemRepositoryMock();
    deleteItemUsecase = DeleteItemUsecaseImpl(deleteItemRepository);
    registerFallbackValue(_item);
  });

  group('Delete Item Usecase test', () {
    test('Deve deletar um item', () async {
      when(
        () => deleteItemRepository.deleteItem(any()),
      ).thenAnswer((invocation) async => right(unit));

      final _result = await deleteItemUsecase(_item);

      expect(_result.fold((l) => l, (r) => r), isA<Unit>());
    });

    test('Deve retornar um erro ao deletar um item', () async {
      when(
        () => deleteItemRepository.deleteItem(any()),
      ).thenAnswer((invocation) async => left(NoDataFound()));

      final _result = await deleteItemUsecase(_item);

      expect(_result.fold((l) => l, (r) => r), isA<Failures>());
    });
  });
}
