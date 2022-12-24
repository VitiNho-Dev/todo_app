import 'package:app_todo/app/modules/item_module/domain/entities/item_entity.dart';
import 'package:app_todo/app/modules/item_module/domain/errors/failures.dart';
import 'package:app_todo/app/modules/item_module/domain/repositories/item_repositories/update_item_repository.dart';
import 'package:app_todo/app/modules/item_module/domain/usecases/item_usecases/update_item_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class UpdateItemRepositoryMock extends Mock implements UpdateItemRepository {}

void main() {
  late UpdateItemRepository updateItemRepository;
  late UpdateItemUsecase updateItemUsecase;
  final item = Item(
    title: 'Item teste',
    id: '123',
    createAt: DateTime.now(),
  );
  const idList = '';

  setUpAll(() async {
    updateItemRepository = UpdateItemRepositoryMock();
    updateItemUsecase = UpdateItemUsecaseImpl(updateItemRepository);
    registerFallbackValue(item);
    registerFallbackValue(idList);
  });

  group('Update Item Usecase test:', () {
    test('Should update an item on Firebase', () async {
      when(
        () => updateItemRepository.updateItem(any(), any()),
      ).thenAnswer((invocation) async => right(unit));

      final result = await updateItemUsecase(item, idList);

      expect(result.fold((l) => l, (r) => r), isA<Unit>());
    });

    test('Should return on error when update an item of Firebase', () async {
      when(
        () => updateItemRepository.updateItem(any(), any()),
      ).thenAnswer((invocation) async => left(const NoDataFound()));

      final result = await updateItemUsecase(item, idList);

      expect(result.fold((l) => l, (r) => r), isA<Failures>());
    });
  });
}
