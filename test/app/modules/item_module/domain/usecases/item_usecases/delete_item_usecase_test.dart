import 'package:app_todo/app/modules/item_module/domain/entities/item_entity.dart';
import 'package:app_todo/app/modules/item_module/domain/errors/items_failures.dart';
import 'package:app_todo/app/modules/item_module/domain/repositories/item_repositories/delete_item_repository.dart';
import 'package:app_todo/app/modules/item_module/domain/usecases/item_usecases/delete_item_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DeleteItemRepositoryMock extends Mock implements DeleteItemRepository {}

void main() {
  late DeleteItemRepository deleteItemRepository;
  late DeleteItemUsecase deleteItemUsecase;
  final item = Item(
    title: 'Item teste',
    id: '123',
    createAt: DateTime.now(),
  );

  setUpAll(() async {
    deleteItemRepository = DeleteItemRepositoryMock();
    deleteItemUsecase = DeleteItemUsecaseImpl(deleteItemRepository);
    registerFallbackValue(item);
  });

  group('Delete Item Usecase test:', () {
    test('Should delete an item on Firebase', () async {
      when(
        () => deleteItemRepository.deleteItem(any()),
      ).thenAnswer((invocation) async => right(unit));

      final result = await deleteItemUsecase(item);

      expect(result.fold((l) => l, (r) => r), isA<Unit>());
    });

    test('Should return on error when delete an item on Firebase', () async {
      when(
        () => deleteItemRepository.deleteItem(any()),
      ).thenAnswer((invocation) async => left(NoDataFound()));

      final result = await deleteItemUsecase(item);

      expect(result.fold((l) => l, (r) => r), isA<Failures>());
    });
  });
}
