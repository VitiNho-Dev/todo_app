import 'package:app_todo/app/modules/item_module/domain/entities/list_entity.dart';
import 'package:app_todo/app/modules/item_module/domain/errors/failures.dart';
import 'package:app_todo/app/modules/item_module/domain/repositories/lists_repositories/add_list_repository.dart';
import 'package:app_todo/app/modules/item_module/domain/usecases/lists_usecases/add_list_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AddListReposotoryMock extends Mock implements AddListRepository {}

void main() {
  late final AddListRepository addListRepository;
  late final AddListUsecase addListUsecase;
  final listItems = ListItems(
    id: '1234',
    name: 'Teste',
    description: 'Testando',
    createAt: DateTime(16, 11, 2022),
  );

  setUpAll(() {
    addListRepository = AddListReposotoryMock();
    addListUsecase = AddListUsecaseImpl(addListRepository);
    registerFallbackValue(listItems);
  });

  group('AddListUsecase test:', () {
    test('Should add a ListItem on Firebase', () async {
      when(
        () => addListRepository.addList(any()),
      ).thenAnswer((invocation) async => const Right(unit));

      final result = await addListUsecase(listItems);

      expect(result.fold(id, id), isA<Unit>());
      verify(
        () => addListRepository.addList(listItems),
      ).called(1);
      verifyNoMoreInteractions(addListRepository);
    });

    test('Should a Failure', () async {
      when(
        () => addListRepository.addList(any()),
      ).thenAnswer((invocation) async => const Left(NoDataFound()));

      final result = await addListUsecase(listItems);

      expect(result.fold(id, id), isA<NoDataFound>());
      verify(
        () => addListRepository.addList(listItems),
      ).called(1);
      verifyNoMoreInteractions(addListRepository);
    });
  });
}
