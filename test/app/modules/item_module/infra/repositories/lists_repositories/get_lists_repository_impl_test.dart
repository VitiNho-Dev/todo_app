import 'package:app_todo/app/modules/item_module/domain/entities/list_entity.dart';
import 'package:app_todo/app/modules/item_module/domain/errors/items_failures.dart';
import 'package:app_todo/app/modules/item_module/domain/repositories/lists_repositories/get_lists_repository.dart';
import 'package:app_todo/app/modules/item_module/infra/datasources/lists_datasources/get_lists_datasource.dart';
import 'package:app_todo/app/modules/item_module/infra/repositories/lists_repositories/get_lists_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../utils/lists.dart';

class GetListsDatasourceMock extends Mock implements GetListsDatasource {}

void main() {
  late GetListsDatasource datasource;
  late GetListsRepository repository;

  setUpAll(() {
    datasource = GetListsDatasourceMock();
    repository = GetListsRepositoryImpl(datasource);
  });

  group('GetLists repository test:', () {
    test('Should return a List of Firebase items', () async* {
      when(
        () => datasource.getLists(),
      ).thenAnswer(
        (invocation) => lists,
      );

      final result = repository.getLists();

      expect(result.fold((l) => l, (r) => r), isA<List<ListItems>>());
    });

    test('Should return a error when return a List of Firebase items',
        () async* {
      when(
        () => datasource.getLists(),
      ).thenThrow(
        (invocation) => InvalidError(),
      );

      final result = repository.getLists();

      expect(result.fold((l) => l, (r) => r), isA<Failures>());
    });
  });
}
